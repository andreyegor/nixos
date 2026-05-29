{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      echo -en "\033[6n" > /dev/tty
      IFS='[;' read -r -d R -s _ row _ < /dev/tty 2>/dev/null
      if [[ "$row" -eq 1 ]]; then
        fastfetch --structure OS:Uptime:WM:Shell:Terminal --logo-type small
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "scala"
        "python"
        "docker"

        "z"
        "sudo"
        "vscode"
        "history"
        "extract"
        "command-not-found"
        "colored-man-pages"
      ];
      theme = "agnoster";
      extraConfig = ''
        ENABLE_CORRECTION="true"
        CORRECT_IGNORE='_*'
      '';
    };

    history = {
      size = 10000;
      ignoreDups = true;
      share = true;
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
      {
        name = "nix-zsh-completions";
        src = pkgs.nix-zsh-completions;
      }
    ];

  };
  home.packages = with pkgs; [
    fastfetch
  ];
}
