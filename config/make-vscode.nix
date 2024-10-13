{
  pkgs,
  lib,
}: {
  # Generate the VSCode derivation
  mkVSCodeDerivation = {
    name ? "default",
    additionalExtensions ? [],
    additionalVSCodeSettings ? {},
    additionalPackages ? [],
    environmentVars ? {},
    impureExtensions ? false,
  }: let
    defaultPackages = with pkgs; [
      nixd
      jq
      alejandra
      marksman
      yamlfmt
      yamllint
      vale
    ];

    # Collect all extensions and settings
    vscode-config = (import ./global-configuration.nix) {inherit pkgs lib;};
    allExtensions = vscode-config.globalExtensions ++ additionalExtensions;
    allVSCodeSettings = vscode-config.globalSettings // additionalVSCodeSettings;
    allPackages = defaultPackages ++ additionalPackages;
    jsonSettings = pkgs.writeTextFile {
      name = "vscode-${name}-settings";
      text = builtins.toJSON allVSCodeSettings;
      destination = "/user/settings.json";
    };
    code-with-extensions = pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscode;
      vscodeExtensions = allExtensions;
    };

    # Create a script to install extensions for impure extensions
    installExtensionsScript = pkgs.writeShellScript "install-vscode-extensions" ''
      mkdir -p "$HOME/.config/vscode/${name}/extensions"
      ${lib.concatMapStrings (ext: ''
          ${pkgs.vscode}/bin/code --extensions-dir "$HOME/.config/vscode/${name}/extensions" --install-extension ${ext.vscodeExtUniqueId} --force
        '')
        allExtensions}
    '';

    # Function to generate --set arguments for wrapProgram
    generateSetArgs = vars: lib.concatStringsSep " " (lib.mapAttrsToList (name: value: "--set ${name} ${value}") vars);
  in
    pkgs.stdenv.mkDerivation {
      name = "code";
      src = ./.;
      buildInputs = [
        pkgs.makeWrapper
      ];
      # TODO this could probably be cleaner
      # TODO does this work for other users, with $HOME evaluated at install time?  It might, if each user installs via home-manager, but would need to test.
      installPhase =
        if impureExtensions
        then ''
          mkdir -p $out/bin
          cp ${pkgs.writeShellScript "code" ''
            if [ ! -d "$HOME/.config/vscode/${name}/extensions" ]; then
              ${installExtensionsScript}
            fi
            mkdir -p "$HOME/.config/vscode/${name}/data/User"
            ${pkgs.jq}/bin/jq . < ${jsonSettings}/user/settings.json > "$HOME/.config/vscode/${name}/data/User/settings.json"
            ${pkgs.vscode}/bin/code --extensions-dir "$HOME/.config/vscode/${name}/extensions" --user-data-dir "$HOME/.config/vscode/${name}/data" "$@"
          ''} $out/bin/code
          chmod +x $out/bin/code
          wrapProgram $out/bin/code \
            --prefix PATH : ${lib.makeBinPath allPackages} \
            ${generateSetArgs environmentVars}
        ''
        else ''
          mkdir -p $out/bin
          cp ${pkgs.writeShellScript "code" ''
            mkdir -p $HOME/.config/vscode/${name}/data/User
            ${pkgs.jq}/bin/jq . < ${jsonSettings}/user/settings.json > $HOME/.config/vscode/${name}/data/User/settings.json
            ${code-with-extensions}/bin/code --user-data-dir "$HOME/.config/vscode/${name}/data" "$@"
          ''} $out/bin/code
          chmod +x $out/bin/code
          wrapProgram $out/bin/code \
            --prefix PATH : ${lib.makeBinPath allPackages} \
            ${generateSetArgs environmentVars}
        '';
      meta = {
        mainProgram = "code";
      };
    };

  mkApp = vsCodeDerivation: {
    type = "app";
    program = "${vsCodeDerivation}/bin/code";
  };
}
