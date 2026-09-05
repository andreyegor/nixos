{
  ...
}:
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

      mode.main.binding = {
        # Apps
        "alt-s"     = "exec-and-forget kitty";
        "alt-l"     = "exec-and-forget /System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine";

        # Windows
        "alt-q"       = "close";
        "alt-f"       = "fullscreen";
        "alt-shift-f" = "layout fullscreen tiling";
        "alt-v"       = "layout floating tiling";

        # Resize  (Mod+Minus / Mod+Equal)
        "alt-minus"       = "resize width -100";
        "alt-equal"       = "resize width +100";
        "alt-shift-minus" = "resize height -100";
        "alt-shift-equal" = "resize height +100";

        # Focus  (Mod+Arrow)
        "alt-left"  = "focus left";
        "alt-right" = "focus right";
        "alt-up"    = "focus up";
        "alt-down"  = "focus down";

        # Move  (Mod+Shift+Arrow)
        "alt-shift-left"  = "move left";
        "alt-shift-right" = "move right";
        "alt-shift-up"    = "move up";
        "alt-shift-down"  = "move down";

        # Monitor focus  (Mod+Ctrl+Arrow)
        "alt-ctrl-left"  = "focus-monitor left";
        "alt-ctrl-right" = "focus-monitor right";

        # Move to monitor  (Mod+Shift+Ctrl+Arrow)
        "alt-shift-ctrl-left"  = "move-node-to-monitor left";
        "alt-shift-ctrl-right" = "move-node-to-monitor right";

        # Workspaces  (Mod+1-9)
        "alt-1" = "workspace 1";
        "alt-2" = "workspace 2";
        "alt-3" = "workspace 3";
        "alt-4" = "workspace 4";
        "alt-5" = "workspace 5";
        "alt-6" = "workspace 6";
        "alt-7" = "workspace 7";
        "alt-8" = "workspace 8";
        "alt-9" = "workspace 9";

        # Move to workspace  (Mod+Shift+1-9)
        "alt-shift-1" = "move-node-to-workspace 1";
        "alt-shift-2" = "move-node-to-workspace 2";
        "alt-shift-3" = "move-node-to-workspace 3";
        "alt-shift-4" = "move-node-to-workspace 4";
        "alt-shift-5" = "move-node-to-workspace 5";
        "alt-shift-6" = "move-node-to-workspace 6";
        "alt-shift-7" = "move-node-to-workspace 7";
        "alt-shift-8" = "move-node-to-workspace 8";
        "alt-shift-9" = "move-node-to-workspace 9";
      };
    };
  };
}
