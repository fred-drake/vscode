# List all commands
default:
    @just --list --unsorted

# Refresh VSCode Extensions
update:
    nix4vscode ./config/vscode-extensions.toml > ./config/extensions.nix && alejandra ./config/extensions.nix
