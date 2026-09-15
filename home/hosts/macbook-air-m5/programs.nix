{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  # MLX значительно ускоряющий модели на Apple Silicon невозможно собрать в nix sandbox так как
  # Metal-компилятор, необходимый для сборки MLX с поддержкой Metal, не является open-source.
  # https://aldur.blog/micros/2025/11/04/mlx-with-metal-support-through-nix/
  # https://github.com/NixOS/nixpkgs/issues/390995
  # Сейчас не mlx модели работают значительно медленнее mlx.

  services.ollama = {
    enable = true;
    package = pkgsUnstable.ollama;
  };
}
