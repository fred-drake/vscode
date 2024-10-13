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

        make-vscode = import ./config/make-vscode.nix {inherit pkgs lib;};
        extensions = (import ./config/extensions.nix) {
          pkgs = pkgs;
          lib = lib;
        };

        vscode-default = make-vscode.mkVSCodeDerivation {
          name = "default";
          additionalExtensions = [];
          additionalVSCodeSettings = {};
          additionalPackages = [];
        };

        vscode-csharp = make-vscode.mkVSCodeDerivationImpureExtensions {
          name = "csharp";
          additionalExtensions = with extensions; [
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            ms-dotnettools.vscode-dotnet-runtime
            csharpier.csharpier-vscode
          ];
          additionalVSCodeSettings = {
            # TODO add settings and other packages
            "extensions.autoUpdate" = true;
            "[csharp]" = {
              "editor.defaultFormatter" = "csharpier.csharpier-vscode";
              "editor.formatOnSave" = true;
            };
          };
          additionalPackages = with pkgs; [
            dotnet-sdk_8
            csharpier
          ];
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
        };
        packages = {
          default = vscode-default;
          csharp = vscode-csharp;
        };
        apps = {
          default = make-vscode.mkApp vscode-default;
          csharp = make-vscode.mkApp vscode-csharp;
        };
      };
    };
}
