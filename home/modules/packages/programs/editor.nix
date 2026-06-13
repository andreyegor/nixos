{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      default_shell = "zsh";
      copy_command = "wl-copy";
      mouse_mode = true;
    };
  };
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin-mocha";

      editor = {
        mouse = true;
        line-number = "relative";
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        true-color = true;
        completion-trigger-len = 1;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
          character = "▏";
          skip-levels = 1;
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        statusline = {
          left = [
            "version-control"
            "file-name"
            "file-modification-indicator"
            "file-encoding"
          ];
          center = [ "diagnostics" ];
          right = [
            "mode"
            "position"
            "file-type"
            "spinner"
          ];
        };

        file-picker.hidden = false;
      };
    };

    languages = {
      language-server = {
        nixd.command = "nixd";
        rust-analyzer.command = "rust-analyzer";
        clangd.command = "clangd";
        kotlin-language-server.command = "kotlin-language-server";
        elixir-ls.command = "elixir-ls";
        metals.command = "metals";
        gleam.command = "gleam";
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "alejandra";
          language-servers = [ "nixd" ];
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "c";
          auto-format = true;
          formatter = {
            command = "clang-format";
          };
          language-servers = [ "clangd" ];
        }
        {
          name = "cpp";
          auto-format = true;
          formatter = {
            command = "clang-format";
          };
          language-servers = [ "clangd" ];
        }
        {
          name = "kotlin";
          auto-format = true;
          formatter = {
            command = "ktfmt";
            args = [ "-" ];
          };
          language-servers = [ "kotlin-language-server" ];
        }
        {
          name = "elixir";
          auto-format = true;
          language-servers = [ "elixir-ls" ];
        }
        {
          name = "scala";
          auto-format = true;
          formatter = {
            command = "scalafmt";
            args = [ "--stdin" ];
          };
          language-servers = [ "metals" ];
        }
        # {
        #   name = "gleam";
        #   auto-format = true;
        #   language-servers = [ "gleam" ];
        # }
      ];
    };

    extraPackages = with pkgs; [
      # tools
      lazygit
      ripgrep
      fd
      yazi
      # LSP
      nixd
      rust-analyzer
      clang-tools
      kotlin-language-server
      elixir-ls
      metals
      # gleam
      # formatters
      alejandra
      ktfmt
      scalafmt
    ];
  };
}
