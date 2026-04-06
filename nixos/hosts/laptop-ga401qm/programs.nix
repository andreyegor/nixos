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
      "qwen3:4b"
      "qwen3.5:4b"
      "nemotron-3-nano:4b"
      "qwen2.5-coder:7b"
      "deepseek-r1:8b"
    ];
  };
}
