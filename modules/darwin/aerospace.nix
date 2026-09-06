{ pkgs, ... }:
let
  aerospace = "/run/current-system/sw/bin/aerospace";
  switchWs = pkgs.writeShellScript "aerospace-switch-ws" ''
    N=$1
    MONITOR=$(${aerospace} list-monitors --focused | awk '{print $1}')
    if [ "$MONITOR" = "1" ]; then
      ${aerospace} workspace "$N"
    else
      ${aerospace} workspace "$((N + 10))"
    fi
  '';
  moveToWs = pkgs.writeShellScript "aerospace-move-to-ws" ''
    N=$1
    MONITOR=$(${aerospace} list-monitors --focused | awk '{print $1}')
    if [ "$MONITOR" = "1" ]; then
      ${aerospace} move-node-to-workspace "$N"
    else
      ${aerospace} move-node-to-workspace "$((N + 10))"
    fi
  '';
in
{
  services.aerospace = {
    enable = true;
    settings = {
      automatically-unhide-macos-hidden-apps = true;

      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.right = 10;
        outer.top = 10;
        outer.bottom = 10;
      };

      workspace-to-monitor-force-assignment = {
        "1"  = 1; "2"  = 1; "3"  = 1; "4"  = 1; "5"  = 1;
        "6"  = 1; "7"  = 1; "8"  = 1; "9"  = 1;
        "11" = 2; "12" = 2; "13" = 2; "14" = 2; "15" = 2;
        "16" = 2; "17" = 2; "18" = 2; "19" = 2;
      };

      mode.main.binding = {
        "alt-s" = "exec-and-forget kitty";
        "alt-l" = "exec-and-forget /System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine";

        "alt-q" = "close";
        "alt-f" = "fullscreen";
        "alt-v" = "layout floating tiling";

        "alt-minus"       = "resize width -100";
        "alt-equal"       = "resize width +100";
        "alt-shift-minus" = "resize height -100";
        "alt-shift-equal" = "resize height +100";

        "alt-left"  = "focus left";
        "alt-right" = "focus right";
        "alt-up"    = "focus up";
        "alt-down"  = "focus down";

        "alt-shift-left"  = "move left";
        "alt-shift-right" = "move right";
        "alt-shift-up"    = "move up";
        "alt-shift-down"  = "move down";

        "alt-ctrl-left"  = "focus-monitor left";
        "alt-ctrl-right" = "focus-monitor right";

        "alt-shift-ctrl-left"  = "move-node-to-monitor left";
        "alt-shift-ctrl-right" = "move-node-to-monitor right";

        "alt-1" = "exec-and-forget ${switchWs} 1";
        "alt-2" = "exec-and-forget ${switchWs} 2";
        "alt-3" = "exec-and-forget ${switchWs} 3";
        "alt-4" = "exec-and-forget ${switchWs} 4";
        "alt-5" = "exec-and-forget ${switchWs} 5";
        "alt-6" = "exec-and-forget ${switchWs} 6";
        "alt-7" = "exec-and-forget ${switchWs} 7";
        "alt-8" = "exec-and-forget ${switchWs} 8";
        "alt-9" = "exec-and-forget ${switchWs} 9";

        "alt-shift-1" = "exec-and-forget ${moveToWs} 1";
        "alt-shift-2" = "exec-and-forget ${moveToWs} 2";
        "alt-shift-3" = "exec-and-forget ${moveToWs} 3";
        "alt-shift-4" = "exec-and-forget ${moveToWs} 4";
        "alt-shift-5" = "exec-and-forget ${moveToWs} 5";
        "alt-shift-6" = "exec-and-forget ${moveToWs} 6";
        "alt-shift-7" = "exec-and-forget ${moveToWs} 7";
        "alt-shift-8" = "exec-and-forget ${moveToWs} 8";
        "alt-shift-9" = "exec-and-forget ${moveToWs} 9";
      };
    };
  };
}
