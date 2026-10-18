{ ... }:
{
  # MLX значительно ускоряющий модели на Apple Silicon невозможно собрать в nix sandbox так как
  # Metal-компилятор, необходимый для сборки MLX с поддержкой Metal, не является open-source
  # (nixpkgs-пакет жёстко отключает MLX-backend: -DOLLAMA_MLX_BACKENDS="").
  # https://aldur.blog/micros/2025/11/04/mlx-with-metal-support-through-nix/
  # https://github.com/NixOS/nixpkgs/issues/390995
  # Поэтому ollama здесь ставится через Homebrew (modules/darwin/homebrew.nix) —
  # бутылки homebrew-core собираются с доступом к Metal-компилятору и тащат mlx-c.
}
