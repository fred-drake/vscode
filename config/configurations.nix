{
  pkgs,
  nix-vscode-extensions,
  lib,
}: let
  make-vscode = import ./make-vscode.nix {inherit pkgs lib;};
  extensions = (import ./extensions.nix) {
    pkgs = pkgs;
    lib = lib;
  };
  marketplace = nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
in {
  default = make-vscode.mkVSCodeDerivation {
    name = "default";
  };

  csharp = make-vscode.mkVSCodeDerivation {
    name = "csharp";
    additionalExtensions = with extensions; [
      ms-dotnettools.csdevkit
      ms-dotnettools.csharp
      ms-dotnettools.vscode-dotnet-runtime
      csharpier.csharpier-vscode
    ];
    additionalVSCodeSettings = {
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
    impureExtensions = true;
  };

  rust = make-vscode.mkVSCodeDerivation {
    name = "rust";
    additionalExtensions = with extensions;
      [
        rust-lang.rust-analyzer
        fill-labs.dependi
      ]
      # nix4vscode can't read this, adding through nix-vscode-extensions
      ++ [
        marketplace.vadimcn.vscode-lldb
      ];
    additionalVSCodeSettings = {
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "editor.formatOnSave" = true;
      };
      # Add the todo! macro as a TODO highlight
      "todo-tree.regex.regex" = "(//|#|<!--|;|/\\*|^|^[ \\t]*(-|\\d+.))\\s*($TAGS)|todo!";
    };
    additionalPackages = with pkgs; [
      rust-bin.stable.latest.default
      rust-analyzer
    ];
    environmentVars = {
      "RUST_SRC_PATH" = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };

  golang = make-vscode.mkVSCodeDerivation {
    name = "golang";
    additionalExtensions = with extensions; [
      golang.go
      gofenix.go-lines
    ];
    additionalVSCodeSettings = {
      "go-lines.lineLength" = 120;
      "gopls"."ui.semanticTokens" = true;
      "editor.defaultFormatter" = "gofenix.go-lines";
    };
    additionalPackages = with pkgs; [
      go
      golines
      delve
    ];
  };
}
