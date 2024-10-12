{
  description = "VSCode configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem = {
        system,
        lib,
        ...
      }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        writeSettingsJson = pkgs.writeTextFile {
          name = "vscode-default-settings";
          text = builtins.toJSON vscode-config.settings;
          destination = "/user/settings.json";
        };

        vscode-config = (import ./config) {inherit pkgs lib;};
        code-with-extensions = pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscode;
          vscodeExtensions = vscode-config.globalExtensions;
        };
        # Custom package that includes the script
        custom-vscode = pkgs.stdenv.mkDerivation {
          name = "code";
          src = ./.;
          buildInputs = [
            pkgs.makeWrapper
          ];
          installPhase = ''
            mkdir -p $out/bin
            cp ${pkgs.writeShellScript "code" ''
              mkdir -p ~/.config/vscode/default
              ${pkgs.jq}/bin/jq . < ${writeSettingsJson}/user/settings.json > ~/.config/vscode/default/User/settings.json
              ${code-with-extensions}/bin/code --user-data-dir ~/.config/vscode/default "$@"
            ''} $out/bin/code
            chmod +x $out/bin/code
            wrapProgram $out/bin/code \
              --prefix PATH : ${lib.makeBinPath [pkgs.nixd pkgs.jq pkgs.alejandra pkgs.marksman pkgs.yamlfmt pkgs.yamllint pkgs.vale]}
          '';
          meta = {
            mainProgram = "code";
          };
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
        };
        packages = {
          default = custom-vscode;
        };
        apps = {
          default = {
            type = "app";
            program = "${custom-vscode}/bin/code";
          };
        };
      };
    };
}
