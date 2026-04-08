{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = pkgsUnstable.ollama;
    # Optional: preload models, see https://ollama.com/library
    loadModels = [
      "nemotron-3-nano:4b" # Длям агентов
      "qwen2.5-coder:7b" # Самый умный
      "qwen3.5:4b" # Reasoninig
      "gemma4:e4b" # Самый быстрый
    ];
  };
}
