{
  pkgsUnstable,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = pkgsUnstable.ollama-cuda;
    loadModels = [
      "lfm2.5"
    ];
  };
}
