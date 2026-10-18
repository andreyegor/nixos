{
  config,
  ...
}:
{
  homebrew = {
    enable = true;

    taps = [
      "Sikarugir-App/sikarugir"
      "telepresenceio/telepresence"
    ];

    casks = [
      "incy"
      "sikarugir"
      "vorssaint"
      "steam"
    ];

    brews = [
      "telepresenceio/telepresence/telepresence-oss"
      {
        name = "ollama";
        start_service = true;
      }
    ];
  };

  programs.zsh.interactiveShellInit = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
