# List all commands
default:
    @just --list --unsorted

# Refresh VSCode Extensions
update-extensions:
    nix4vscode ./config/vscode-extensions.toml > ./config/extensions.nix && alejandra ./config/extensions.nix

# Update flake
update:
    nix flake update --commit-lock-file

# Update both extensions and flake
full-update: update update-extensions
