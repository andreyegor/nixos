{
  config,
  pkgs,
  ...
}:
{
  services.ollama = {
    enable = true;
    # Optional: preload models, see https://ollama.com/library
    loadModels = [
      "qwen2.5-coder:7b"
      "deepseek-r1:8b"
      "glm-4.7-flash"
    ];
  };
}
