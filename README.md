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

- Rust - `nix run github:fred-drake/vscode#rust`
- C# - `nix run github:fred-drake/vscode#csharp`
- Go - `nix run github:fred-drake/vscode#golang`
- Python - TBD
- Javascript - TBD
- Infrastructure as Code - TBD

## User Data

All user data is stored in `~/.config/vscode/<config_name>`. This includes extensions, settings, keybindings, application state, etc. The decision to have a hard separation by configuration prevented weird issues with extensions for different configurations bleeding into each other when open at the same time. This comes at the cost of disk space.

VSCode doesn't separate configurations into neater folders like `~/.local` and `~/.config`, so the `settings.json` that is generated from the configuration must cohabitate with other files that will be perpetually modified by VSCode itself.

### Install Multiple Configurations

You can have multiple neovim configurations (`code`, `code-rust`, `code-golang`, etc). Take a look at my [system configuration flake](https://github.com/fred-drake/nix/blob/main/flake.nix) to see how I do this, but here's the gist:

Create a function that creates neovim links with unique configuration names:

```nix
  mkVSCodePackages = pkgs: vscodePkgs: let
    mkVSCodeAlias = name: pkg:
      pkgs.runCommand "vscode-${name}" {} ''
        mkdir -p $out/bin
        ln -s ${pkg}/bin/code $out/bin/code-${name}
      '';
  in
    builtins.mapAttrs mkVSCodeAlias vscodePkgs;
```

And add it to your home-manager imports:

```nix
  ({pkgs, ...}: {
    home.packages =
      (builtins.attrValues (mkVSCodePackages pkgs inputs.vscode.packages.${pkgs.system}))
      ++ [inputs.vscode.packages.${pkgs.system}.default];
  })
```

## Technology Support

| Technology | Formatter        | Language Server    | Debugger   | Nix Configuration |
| ---------- | ---------------- | ------------------ | ---------- | ----------------- |
| Nix        | alejandra        | nixd               |            | default           |
| Just       | just             |                    |            | default           |
| Markdown   | prettier         | marksman           |            | default           |
| YAML       | yamlfmt          | yamllint           |            | default           |
| CSS        | prettier         |                    |            | default           |
| HTML       | prettier         |                    |            | default           |
| JSON       | prettier         |                    |            | default           |
| TOML       | Even Better TOML | Even Better TOML   |            | default           |
| SQL        | SQL Tools        | SQLTools           |            | default           |
| C#         | CSharpier        | C# Dev Kit         | C# Dev Kit | csharp            |
| Rust       | rust-analyzer    | rust-analyzer      | CodeLLDB   | rust              |
| Go         | golines          | Go Language Server | Delve      | golang            |

## Managing Extensions

All extensions that are to be used in any configuration are stored in the [vscode-extensions.toml](./config/vscode-extensions.toml) file. To generate (or update to latest) the raw [extensions file](./config/extensions.nix) from this TOML file, call `just update-extensions`. The [the main nix flake](./flake.nix) pulls this extension information in order to declaratively build VSCode and its extensions.

## Global Extensions and Settings

The [global-configuration.nix](./config/global-configuration.nix) file contains the extensions and settings that will be used across all configurations. See [the main nix flake](./flake.nix) to see how configurations add their extensions and settings. Note that if there is a settings conflict, the configuration-specific setting will overwrite the global setting.

## Impure Extensions Support

Some extensions (such as Microsoft's C# Dev Kit) do not support the pure Nix declarative way. For configurations that require such extensions, an alternate derivation is made such that while VSCode itself is declarative, extensions are
installed through VSCode itself and stored in `~/.config/vscode/<config_name>/extensions`. The tradeoffs from what we would ideally prefer through Nix are:

- Unlike the "pure" equivalent, you will always install the latest version of the extension, not the exact one defined in [extensions.nix](./config/extensions.nix).
- To update extensions through a nix rebuild, you need to delete the `~/.config/vscode/<config_name>/extensions` directory.
