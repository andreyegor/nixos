{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = pkgsUnstable.ollama-cuda;
    # Optional: preload models, see https://ollama.com/library
    loadModels = [
      "nemotron-3-nano:4b"
      "llama3.1:8b"
      "qwen2.5-coder:7b"
      "qwen3.5:4b"
    ];
  };
}
