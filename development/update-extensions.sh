#!/usr/bin/env bash
echo "####################################" > ./config/extensions.nix
echo "# Auto-generated -- do not modify! #" >> ./config/extensions.nix
echo "####################################" >> ./config/extensions.nix
nix4vscode ./config/vscode-extensions.toml >> ./config/extensions.nix
alejandra ./config/extensions.nix
