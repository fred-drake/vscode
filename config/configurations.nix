{
  pkgs,
  nix-vscode-extensions,
  lib,
}: let
  make-vscode = import ./make-vscode.nix {inherit pkgs lib;};
  extensions = (import ./extensions.nix) {
    pkgs = pkgs;
    lib = lib;
  };
  marketplace = nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
in {
  default = make-vscode.mkVSCodeDerivation {
    name = "default";
  };

  csharp = make-vscode.mkVSCodeDerivation {
    name = "csharp";
    additionalExtensions = with extensions; [
    ];
    additionalVSCodeSettings = {
    };
    additionalPackages = with pkgs; [
      dotnet-sdk_8
      csharpier
    ];
    impureExtensions = true;
  };

  rust = make-vscode.mkVSCodeDerivation {
    name = "rust";
    additionalExtensions = with extensions;
      [
      ]
      # nix4vscode can't read this, adding through nix-vscode-extensions
      ++ [
        marketplace.vadimcn.vscode-lldb
      ];
    additionalVSCodeSettings = {
    };
    additionalPackages = with pkgs; [
      rust-bin.stable.latest.default
      rust-analyzer
    ];
    environmentVars = {
      "RUST_SRC_PATH" = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };

  golang = make-vscode.mkVSCodeDerivation {
    name = "golang";
    additionalExtensions = with extensions; [
    ];
    additionalVSCodeSettings = {
    };
    additionalPackages = with pkgs; [
      go
      golines
      delve
    ];
  };
}
