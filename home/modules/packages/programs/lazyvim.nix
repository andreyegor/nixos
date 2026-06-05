{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    plugins = {
      lazy.enable = true;
      lazyvim.enable = true;
      lazygit.enable = true;

      web-devicons.enable = true;
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
      extraPackages = with pkgs; [
        lazygit
        ripgrep
        fd

        # formaters
        alejandra
        clang-tools
        ktfmt
        scalafmt
      ];
    };
  };
}
