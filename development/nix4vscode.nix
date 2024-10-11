{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "nix4vscode";
  version = "unstable-2014-04-15";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = pname;
    rev = "4586c079660e2881d8dea7718711e68bb7c384e5";
    hash = "sha256-ocULMTNWVnRlUd0EJW1A3itjmPBSu4U4xyHVf3+Y20I=";
  };

  cargoHash = "sha256-v6jww8pcdNgZr5C2s93+K00SGKZTPIdl/m8JAhwh4rs=";

  meta = with lib; {
    description = "A tool generate nix expression for vscode extensions";
    homepage = "https://github.com/nix-community/nix4vscode";
    license = licenses.unlicense;
    maintainers = [];
  };
}
