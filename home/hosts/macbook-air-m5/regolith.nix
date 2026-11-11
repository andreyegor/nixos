{ pkgs, config, ... }:
# Regolith — Strata, оптимизированная под M5 (https://tangled.org/ptr.pet/regolith),
# с моделью Swift 1.5 K512 IQ2_XS. Код и модель (~66 ГБ) живут вне Nix в
# ~/.local/share/regolith: сборка требует Metal-компилятор и качает веса с HF.
#
# Агент не стартует сам: держит ~10 ГБ RAM, поэтому только по команде.
#   regolith-start / regolith-stop / regolith-status / regolith-log
#   regolith — запуск в текущем терминале (Ctrl+C для остановки)
let
  root = "${config.home.homeDirectory}/.local/share/regolith";
  label = "org.nix-community.home.regolith";
  port = 18080;
  log = "${root}/serve.log";
  uv = "${pkgs.uv}/bin/uv";
  target = "gui/$(id -u)/${label}";
in
{
  launchd.agents.regolith = {
    enable = true;
    config = {
      ProgramArguments = [ "${root}/scripts/serve_k512_local.sh" ];
      WorkingDirectory = root;
      EnvironmentVariables = {
        HOME = config.home.homeDirectory;
        PATH = "/usr/bin:/bin:/usr/sbin:/sbin";
        UV = uv;
        PORT = toString port;
      };
      RunAtLoad = false;
      KeepAlive = false;
      # Без этого launchd троттлит фоновый I/O, а эксперты стримятся с SSD.
      ProcessType = "Interactive";
      StandardOutPath = log;
      StandardErrorPath = log;
    };
  };

  programs.zsh.shellAliases = {
    regolith = "UV=${uv} PORT=${toString port} ${root}/scripts/serve_k512_local.sh";
    regolith-start = "launchctl kickstart ${target} && echo 'regolith: запускается, готовность — regolith-status'";
    # SIGINT = Ctrl+C: сервер дорабатывает запрос и корректно выгружает движок.
    regolith-stop = "launchctl kill SIGINT ${target}";
    regolith-status = "launchctl print ${target} | grep -E '^\\s+(state|pid|last exit code) =' ; curl -s -m 2 http://127.0.0.1:${toString port}/v1/models | grep -q '\"loaded\"' && echo 'API: готов — http://127.0.0.1:${toString port}/' || echo 'API: не отвечает'";
    regolith-log = "tail -f ${log}";
  };
}
