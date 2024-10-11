{
  description = "VSCode Flake Dev Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs, ...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nix4vscode = pkgs.callPackage ./nix4vscode.nix {};
    in {
      devShells.default = with pkgs;
        mkShell {
          buildInputs = [just nix4vscode alejandra];

          shellHook = "";
        };
    });
}
