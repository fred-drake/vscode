# This file defines a set of common VSCode extensions to be installed.
# It takes two arguments: pkgs (for built-in extensions) and nix-vscode-extensions (for marketplace extensions).
{
  pkgs,
  lib,
}: let
  extensions = (import ./extensions.nix) {
    pkgs = pkgs;
    lib = lib;
  };
in {
  globalExtensions = with extensions; [
    ms-vscode-remote.remote-ssh # Enables remote development over SSH
    mikestead.dotenv # Support for .env file syntax highlighting and autocompletion
    mobalic.jetbrains-dark-theme # Dark theme inspired by JetBrains IDEs
    eamodio.gitlens # Git supercharged - blame, code lens, and powerful comparison commands
    donjayamanne.githistory # View and search git log, file history, compare branches or commits
    oderwat.indent-rainbow # Colorizes indentation for improved readability
    wayou.vscode-todo-highlight # Highlight TODO, FIXME and other annotations in code
    rodrigocfd.format-comment # Format comments in code
    signageos.signageos-vscode-sops
    continue.continue
    pkief.material-icon-theme
    editorconfig.editorconfig
    saoudrizwan.claude-dev
    be5invis.vscode-custom-css
    tamasfe.even-better-toml
    kamadorueda.alejandra
    jnoortheen.nix-ide
    skellock.just
    arr.marksman
    fnando.linter
    bluebrown.yamlfmt
    esbenp.prettier-vscode
    mtxr.sqltools
  ];

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
}
