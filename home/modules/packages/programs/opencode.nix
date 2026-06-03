{
  programs.opencode = {
    enable = true;

    settings = {
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options.baseURL = "http://127.0.0.1:11434/v1";
          models = {
            "lfm2.5".name = "Lfm 2.5 8b";
          };
        };
      };
    };
  };
}
