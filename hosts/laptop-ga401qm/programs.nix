{
  pkgs,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    loadModels = [
      "nemotron-3-nano:4b"
      "llama3.1:8b"
      "qwen2.5-coder:7b"
      "qwen3.5:4b"
    ];
  };
}
