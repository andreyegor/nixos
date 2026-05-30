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
            "nemotron-3-nano:4b".name = "Nemotron 3 nano 4b";
            "llama3.1:8b".name = "Llama 3.1 8b";
            "qwen2.5-coder:7b".name = "Qwen2.5 coder 7b";
            "qwen3.5:4b".name = "Qwen 3.5 4b";
          };
        };
      };
    };
  };
}
