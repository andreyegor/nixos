{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      mouse = "a";
      clipboard = "unnamedplus";
      number = true;
    };

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    plugins = {
      # UI
      lualine.enable = true;
      bufferline.enable = true;
      neo-tree.enable = true;
      noice.enable = true;
      notify.enable = true;
      wilder.enable = true;
      which-key.enable = true;
      dashboard.enable = true;
      web-devicons.enable = true;
      plugins.indent-blankline = {
        enable = true;
        settings.exclude.filetypes = [
          "dashboard"
          "neo-tree"
          "help"
          "terminal"
          "lazy"
          "notify"
        ];
      };

      # Navigate
      telescope.enable = true;

      # Git
      lazygit.enable = true;
      gitsigns.enable = true;

      # Edit
      treesitter.enable = true;
      nvim-autopairs.enable = true;
      comment.enable = true;
      mini = {
        enable = true;
        modules = {
          surround = { };
          ai = { };
        };
      };

      # Completion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
      };
      cmp-nvim-lsp.enable = true;

      # LSP
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          clangd.enable = true;
          kotlin_language_server.enable = true;
          elixirls.enable = true;
          metals.enable = true;
          gleam.enable = true;
        };
      };

      # Format
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            nix = [ "alejandra" ];
            rust = [ "rustfmt" ];
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            kotlin = [ "ktfmt" ];
            elixir = [ "mix" ];
            scala = [ "scalafmt" ];
            gleam = [ "gleam" ];
          };
        };
      };

      # Packages
      extraPackages = with pkgs; [
        lazygit
        ripgrep
        fd

        # Format
        alejandra
        clang-tools
        ktfmt
        scalafmt
      ];
    };

    # Extra Config
    extraConfigLua = ''
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
    '';
  };
}
