# ❄️ My Personal VSCode Setup ❄️

My Nix-based VSCode configuration. For when you have an unhealthy obsession for declarativity and configurability.

## Usage

Option 1: Clone and run

```bash
git clone https://github.com/fred-drake/vscode.git
nix run .#
```

Option 2: Run directly

```bash
nix run github:fred-drake/vscode#
```

To run in a specific directory

```bash
nix run github:fred-drake/vscode# -- .
```

### Configurations

The default configuration performs editing without settings for any particular language or technology. The following configurations a development environment in their respective language or technology stack:

- Rust - TBD
- C# - TBD
- Go - TBD
- Python - TBD
- Javascript - TBD
- Infrastructure as Code - TBD

### Install Multiple Configurations

You can have multiple neovim configurations (`nvim`, `nvim-rust`, `nvim-golang`, etc). Take a look at my [system configuration flake](https://github.com/fred-drake/nix/blob/main/flake.nix) to see how I do this, but here's the gist:

Create a function that creates neovim links with unique configuration names:

```nix
    mkNeovimPackages = pkgs: neovimPkgs: let
      mkNeovimAlias = name: pkg:
        pkgs.runCommand "neovim-${name}" {} ''
          mkdir -p $out/bin
          ln -s ${pkg}/bin/nvim $out/bin/nvim-${name}
        '';
```

And add it to your home-manager imports:

```nix
    ({pkgs, ...}: {
      home.packages =
        (builtins.attrValues (mkNeovimPackages pkgs inputs.neovim.packages.${pkgs.system}))
        ++ [inputs.neovim.packages.${pkgs.system}.default];
    })
```

## Technology Support

| Technology | Formatter        | Language Server  | Nix Configuration |
| ---------- | ---------------- | ---------------- | ----------------- |
| Nix        | alejandra        | nixd             | default           |
| Just       | just             |                  | default           |
| Markdown   | prettier         | marksman         | default           |
| YAML       | yamlfmt          | yamllint         | default           |
| CSS        | prettier         |                  | default           |
| HTML       | prettier         |                  | default           |
| JSON       | prettier         |                  | default           |
| TOML       | Even Better TOML | Even Better TOML | default           |
| SQL        | SQL Tools        | SQLTools         | default           |
