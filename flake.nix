{
  description = "VSCode configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    rust-overlay.url = "github:oxalica/rust-overlay";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs"; # Use the same nixpkgs as above
    };
  };
  outputs = {
    flake-parts,
    nix-vscode-extensions,
    ...
  } @ inputs:
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
          inherit system overlays;
          config.allowUnfree = true;
        };
        overlays = [(import inputs.rust-overlay)];

        make-vscode = import ./config/make-vscode.nix {inherit pkgs lib;};
        configurations = import ./config/configurations.nix {inherit pkgs nix-vscode-extensions lib;};
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
        };
        packages = {
          default = configurations.default;
          csharp = configurations.csharp;
          rust = configurations.rust;
          golang = configurations.golang;
        };
        apps = {
          default = make-vscode.mkApp configurations.default;
          csharp = make-vscode.mkApp configurations.csharp;
          rust = make-vscode.mkApp configurations.rust;
          golang = make-vscode.mkApp configurations.golang;
        };
      };
    };
}
