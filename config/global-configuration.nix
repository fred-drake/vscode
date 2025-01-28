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
    vscodevim.vim # Vim emulation for VSCode
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
    vscodevim.vim # Vim emulation for Visual Studio Code
  ];

  # VSCode Settings that are to be applied in every configuration.  Configuration-specific settings will
  # override if there is a conflict.
  globalSettings = {
    "alejandra.program" = "alejandra";
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontSize" = 16;
    "editor.inlayHints.fontSize" = 12;
    "editor.lineNumbers" = "relative";
    "editor.minimap.enabled" = false;
    "extensions.autoUpdate" = false;
    "files.autoSave" = "onFocusChange";
    "git.autofetch" = true;
    "git.confirmSync" = false;
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd";
    "window.commandCenter" = true;
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredDarkColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredHighContrastColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredHighContrastLightColorTheme" = "Jetbrains Dark Theme";
    "workbench.preferredLightColorTheme" = "Jetbrains Dark Theme";
    "workbench.startupEditor" = "none";
    "update.mode" = "none";
    "vim.enableNeovim" = true;
    "vim.highlightedyank.enable" = true;
    "vim.leader" = "<Space>";
    "vim.smartRelativeLine" = true;
    "vim.useSystemClipboard" = true;
    "vim.insertModeKeyBindings" = [
      {
        "before" = ["j" "k"];
        "after" = ["<Esc>"];
      }
    ];
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
  };

  globalKeyBindings = [
    # Activates and hides the file explorer window
    {
      "key" = "space e";
      "command" = "runCommands";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
      "args" = {
        "commands" = ["workbench.action.toggleSidebarVisibility" "workbench.explorer.fileView.focus"];
      };
    }
    {
      "key" = "space e";
      "command" = "workbench.action.toggleSidebarVisibility";
      "when" = "vim.mode == 'Normal' && filesExplorerFocus";
    }

    #
    # Operations performed directly on the file explorer window
    #
    {
      # Rename file
      "key" = "r";
      "command" = "renameFile";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Copy file
      "key" = "c";
      "command" = "filesExplorer.copy";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Paste file
      "key" = "p";
      "command" = "filesExplorer.paste";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Cut file
      "key" = "x";
      "command" = "filesExplorer.cut";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Delete file
      "key" = "d";
      "command" = "deleteFile";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Create new file
      "key" = "a";
      "command" = "explorer.newFile";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Create new folder
      "key" = "shift-a";
      "command" = "explorer.newFolder";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Open file in a new vertical split
      "key" = "s";
      "command" = "explorer.openToSide";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
    }
    {
      # Open file in a new horizontal split
      "key" = "shift-s";
      "command" = "runCommands";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      "args" = {
        "commands" = ["workbench.action.splitEditorDown" "explorer.openAndPassFocus"];
      };
    }
    {
      # Open the file and close the explorer window
      "key" = "enter";
      "command" = "runCommands";
      "when" = "filesExplorerFocus && foldersViewVisible && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      "args" = {
        "commands" = ["explorer.openAndPassFocus" "workbench.action.toggleSidebarVisibility"];
      };
    }

    #
    # Navigation commands
    #

    {
      # Navigate next tab to the left
      "key" = "shift-h";
      "command" = "workbench.action.previousEditorInGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      # Navigate next tab to the right
      "key" = "shift-l";
      "command" = "workbench.action.nextEditorInGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      # Split the editor vertically
      "key" = "space shift-\\";
      "command" = "workbench.action.splitEditorRight";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      # Split the editor horizontally
      "key" = "space -";
      "command" = "workbench.action.splitEditorDown";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    # Move between editor groups in hjkl fashion
    {
      "key" = "ctrl-h";
      "command" = "workbench.action.focusLeftGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "ctrl-j";
      "command" = "workbench.action.focusBelowGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "ctrl-k";
      "command" = "workbench.action.focusAboveGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "ctrl-l";
      "command" = "workbench.action.focusRightGroup";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }

    # Open AI Assistant Window
    {
      "key" = "space a";
      "command" = "runCommands";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
      "args" = {
        "commands" = ["workbench.action.toggleSidebarVisibility" "workbench.view.extension.roo-cline-ActivityBar"];
      };
    }
    # Possible code actions
    {
      "key" = "space c a";
      "command" = "editor.action.codeAction";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space /";
      "command" = "workbench.action.findInFiles";
      "when" = "vim.mode == 'Normal' && (editorTextFocus || filesExplorerFocus)";
    }
    {
      "key" = "space f";
      "command" = "workbench.action.quickOpen";
      "when" = "vim.mode == 'Normal' && (editorTextFocus || filesExplorerFocus)";
    }
    {
      "key" = "space c c";
      "command" = "workbench.action.showCommands";
      "when" = "vim.mode == 'Normal' && (editorTextFocus || filesExplorerFocus)";
    }
    {
      "key" = "space s";
      "command" = "workbench.action.gotoSymbol";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space shift-s";
      "command" = "workbench.action.showAllSymbols";
      "when" = "vim.mode == 'Normal' && (editorTextFocus || filesExplorerFocus)";
    }
    {
      "key" = "shift-k";
      "command" = "editor.action.showHover";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space c r";
      "command" = "editor.action.rename";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space b b";
      "command" = "workbench.action.quickOpenPreviousRecentlyUsedEditor";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space b d";
      "command" = "workbench.action.closeActiveEditor";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space g d";
      "command" = "editor.action.revealDefinition";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
    {
      "key" = "space g r";
      "command" = "editor.action.goToReferences";
      "when" = "vim.mode == 'Normal' && editorTextFocus";
    }
  ];

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
