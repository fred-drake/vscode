# List all commands
default:
    @just --list --unsorted

# Refresh VSCode Extensions
update-extensions:
    development/update-extensions.sh

# Update flake
update:
    nix flake update --commit-lock-file

# Update both extensions and flake
full-update: update update-extensions

# Run flake check to verify integrity
test:
    nix flake check .
