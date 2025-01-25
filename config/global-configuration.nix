{
  pkgs,
  lib,
}: let
  extensions = (import ./extensions.nix) {
    pkgs = pkgs;
    lib = lib;
  };
in {
  # VSCode Extensions that are to be installed in every configuration
  globalExtensions = with extensions; [
    ms-vscode-remote.remote-ssh # Enables remote development over SSH
    mikestead.dotenv # Support for .env file syntax highlighting and autocompletion
    mobalic.jetbrains-dark-theme # Dark theme inspired by JetBrains IDEs
    eamodio.gitlens # Git supercharged - blame, code lens, and powerful comparison commands
    donjayamanne.githistory # View and search git log, file history, compare branches or commits
    oderwat.indent-rainbow # Colorizes indentation for improved readability
    wayou.vscode-todo-highlight # Highlight TODO, FIXME and other annotations in code
    rodrigocfd.format-comment # Format comments in code
    signageos.signageos-vscode-sops # Syntax highlighting for SOPS (SecretOps) files
    continue.continue # Continue - AI pair programmer
    pkief.material-icon-theme # Material Icon Theme for VS Code
    editorconfig.editorconfig # EditorConfig Support for Visual Studio Code
    rooveterinaryinc.roo-cline # AI pair programmer for VS Code
    be5invis.vscode-custom-css # Custom CSS for Visual Studio Code
    tamasfe.even-better-toml # Better TOML support for Visual Studio Code
    kamadorueda.alejandra # Formatter for Nix files
    jnoortheen.nix-ide # Syntax highlighting for Nix and other languages used in the Nix ecosystem
    skellock.just # Syntax highlighting for Justfiles
    arr.marksman # Syntax highlighting for Markdown files with live preview and TOC support
    fnando.linter # Linter for YAML files
    bluebrown.yamlfmt # Format YAML files with yamlfmt
    esbenp.prettier-vscode # Prettier formatter for Visual Studio Code
    mtxr.sqltools # SQLTools - Query, Connection and IntelliSense for MySQL, PostgreSQL, SQLite, MariaDB, MS SQL, Oracle and IBM DB2 databases
    usernamehw.errorlens # Error Lens - Improve highlighting of errors, warnings and other language diagnostics
    gruntfuggly.todo-tree # Todo Tree - Show TODO, FIXME and other markers in the file explorer
    gaborv.flatbuffers # FlatBuffers syntax highlighting and autocompletion
  ];

  # VSCode Settings that are to be applied in every configuration.  Configuration-specific settings will
  # override if there is a conflict.
  globalSettings = {
    "extensions.autoUpdate" = false;
    "window.commandCenter" = true;
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredDarkColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredHighContrastColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredHighContrastLightColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredLightColorTheme" = "Jetbrains Dark Theme";
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "git.confirmSync" = false;
    "editor.fontSize" = 16;
    "files.autoSave" = "onFocusChange";
    "git.autofetch" = true;
    "workbench.startupEditor" = "none";
    "update.mode" = "none";
    "[nix]" = {
      "editor.defaultFormatter" = "kamadorueda.alejandra";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
    };
    "[markdown]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "[css]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "[html]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "linter.linters" = {
      "vale" = {
        "enabled" = false;
      };
    };
    "alejandra.program" = "alejandra";
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd";
  };

  # Nix packages that are to be installed with every configuration.
  globalPackages = with pkgs; [
    nixd # nix language server
    jq # json processor
    alejandra # formatter for Nix code
    marksman # markdown linter
    yamlfmt # formatter for YAML
    yamllint # linter for YAML
    vale # markdown linter
  ];
}
