{
  config,
  pkgs,
  ...
}:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:win_space_toggle";
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
        mouse = {
          accel-profile = "flat";
          accel-speed = -0.15;
        };
      };

      environment = {
        QT_QPA_PLATFORMTHEME = "gtk3";
      };

      layout = {
        gaps = 10;
        center-focused-column = "never";
        always-center-single-column = true;
        preset-column-widths = [
          { proportion = 0.2; }
          { proportion = 0.5; }
          { proportion = 0.7; }
        ];
        default-column-width = {
          proportion = 0.5;
        };
        focus-ring = {
          width = 4;
          active.color = "#cba6f7"; # Catppuccin Mocha Lavender
          inactive.color = "#313244"; # Catppuccin Mocha Surface0
        };
        border = {
          enable = false;
          width = 4;
        };
        background-color = "transparent";
      };

      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-wallpaper*"; }
          ];
          place-within-backdrop = true;
        }
      ];

      overview.workspace-shadow.enable = false;

      hotkey-overlay.skip-at-startup = true;

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      window-rules = [
        {
          matches = [
            {
              app-id = "steam";
              title = "^notificationtoasts_\\d+_desktop$";
            }
          ];
          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
          open-focused = false;
        }
        {
          matches = [
            {
              app-id = "jetbrains-studio";
              title = "Add File to Git";
            }
            {
              app-id = "jetbrains-studio";
              title = "Confirm Exit";
            }
            {
              app-id = "jetbrains-studio";
              title = "Keep All Changes?";
            }
            {
              app-id = "jetbrains-studio";
              title = "Rename";
            }
            {
              app-id = "jetbrains-studio";
              title = "Delete";
            }
          ];
          open-floating = true;
        }
        {
          geometry-corner-radius = {
            top-left = 10.0;
            top-right = 10.0;
            bottom-left = 10.0;
            bottom-right = 10.0;
          };
          clip-to-geometry = true;
        }
      ];

      spawn-at-startup = [
        { command = [ "udiskie" ]; }
        { command = [ "noctalia-shell" ]; }
        { command = [ "xwayland-satellite" ]; }
        {
          command = [
            "sh"
            "-c"
            "sleep 1 && noctalia-shell ipc call lockScreen lock"
          ];
        }
        {
          command = [
            "sh"
            "-c"
            ''swayidle -w before-sleep "noctalia-shell ipc call lockScreen lock" &''
          ];
        }
        {
          command = [
            "sh"
            "-c"
            "sleep 3 && Throne"
          ];
        }
      ];

      binds =
        let
          a = config.lib.niri.actions;
          sh = cmd: a.spawn "sh" "-c" cmd;
        in
        {
          "Mod+Shift+Slash".action = {
            show-hotkey-overlay = { };
          };

          "Mod+S".action = a.spawn "kitty";
          "Mod+Z".action = a.spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
          "Mod+L".action = a.spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";

          "XF86AudioRaiseVolume" = {
            allow-when-locked = true;
            action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
          };
          "XF86AudioLowerVolume" = {
            allow-when-locked = true;
            action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
          };
          "XF86AudioMute" = {
            allow-when-locked = true;
            action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };
          "XF86AudioMicMute" = {
            allow-when-locked = true;
            action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          };

          "XF86AudioPlay" = {
            allow-when-locked = true;
            action = sh "playerctl play-pause";
          };
          "XF86AudioStop" = {
            allow-when-locked = true;
            action = sh "playerctl stop";
          };
          "XF86AudioPrev" = {
            allow-when-locked = true;
            action = sh "playerctl previous";
          };
          "XF86AudioNext" = {
            allow-when-locked = true;
            action = sh "playerctl next";
          };

          "XF86MonBrightnessUp" = {
            allow-when-locked = true;
            action = a.spawn "brightnessctl" "--class=backlight" "set" "+10%";
          };
          "XF86MonBrightnessDown" = {
            allow-when-locked = true;
            action = a.spawn "brightnessctl" "--class=backlight" "set" "10%-";
          };

          "XF86KbdBrightnessUp".action = a.spawn "brightnessctl" "-d" "asus::kbd_backlight" "set" "+1";
          "XF86KbdBrightnessDown".action = a.spawn "brightnessctl" "-d" "asus::kbd_backlight" "set" "1-";

          "Mod+A" = {
            repeat = false;
            action = {
              toggle-overview = { };
            };
          };
          "Mod+Q" = {
            repeat = false;
            action = {
              close-window = { };
            };
          };

          "Mod+Left".action = {
            focus-column-left = { };
          };
          "Mod+Right".action = {
            focus-column-right = { };
          };

          "Mod+Shift+Left".action = {
            move-column-left = { };
          };
          "Mod+Shift+Right".action = {
            move-column-right = { };
          };

          "Mod+Home".action = {
            focus-column-first = { };
          };
          "Mod+End".action = {
            focus-column-last = { };
          };
          "Mod+Ctrl+Home".action = {
            move-column-to-first = { };
          };
          "Mod+Ctrl+End".action = {
            move-column-to-last = { };
          };

          "Mod+Ctrl+Left".action = {
            focus-monitor-left = { };
          };
          "Mod+Ctrl+Right".action = {
            focus-monitor-right = { };
          };

          "Mod+Shift+Ctrl+Left".action = {
            move-column-to-monitor-left = { };
          };
          "Mod+Shift+Ctrl+Down".action = {
            move-column-to-monitor-down = { };
          };
          "Mod+Shift+Ctrl+Up".action = {
            move-column-to-monitor-up = { };
          };
          "Mod+Shift+Ctrl+Right".action = {
            move-column-to-monitor-right = { };
          };

          "Mod+Down".action = {
            focus-workspace-down = { };
          };
          "Mod+Up".action = {
            focus-workspace-up = { };
          };
          "Mod+Shift+Down".action = {
            move-column-to-workspace-down = { };
          };
          "Mod+Shift+Up".action = {
            move-column-to-workspace-up = { };
          };

          "Mod+Ctrl+Down".action = {
            move-workspace-down = { };
          };
          "Mod+Ctrl+Up".action = {
            move-workspace-up = { };
          };

          "Mod+WheelScrollDown" = {
            cooldown-ms = 150;
            action = {
              focus-workspace-down = { };
            };
          };
          "Mod+WheelScrollUp" = {
            cooldown-ms = 150;
            action = {
              focus-workspace-up = { };
            };
          };
          "Mod+Ctrl+WheelScrollDown" = {
            cooldown-ms = 150;
            action = {
              move-column-to-workspace-down = { };
            };
          };
          "Mod+Ctrl+WheelScrollUp" = {
            cooldown-ms = 150;
            action = {
              move-column-to-workspace-up = { };
            };
          };

          "Mod+WheelScrollRight".action = {
            focus-column-right = { };
          };
          "Mod+WheelScrollLeft".action = {
            focus-column-left = { };
          };
          "Mod+Ctrl+WheelScrollRight".action = {
            move-column-right = { };
          };
          "Mod+Ctrl+WheelScrollLeft".action = {
            move-column-left = { };
          };

          "Mod+Shift+WheelScrollDown".action = {
            focus-column-right = { };
          };
          "Mod+Shift+WheelScrollUp".action = {
            focus-column-left = { };
          };
          "Mod+Ctrl+Shift+WheelScrollDown".action = {
            move-column-right = { };
          };
          "Mod+Ctrl+Shift+WheelScrollUp".action = {
            move-column-left = { };
          };

          "Mod+1".action = {
            focus-workspace = 1;
          };
          "Mod+2".action = {
            focus-workspace = 2;
          };
          "Mod+3".action = {
            focus-workspace = 3;
          };
          "Mod+4".action = {
            focus-workspace = 4;
          };
          "Mod+5".action = {
            focus-workspace = 5;
          };
          "Mod+6".action = {
            focus-workspace = 6;
          };
          "Mod+7".action = {
            focus-workspace = 7;
          };
          "Mod+8".action = {
            focus-workspace = 8;
          };
          "Mod+9".action = {
            focus-workspace = 9;
          };

          "Mod+Ctrl+1".action = {
            move-column-to-workspace = 1;
          };
          "Mod+Ctrl+2".action = {
            move-column-to-workspace = 2;
          };
          "Mod+Ctrl+3".action = {
            move-column-to-workspace = 3;
          };
          "Mod+Ctrl+4".action = {
            move-column-to-workspace = 4;
          };
          "Mod+Ctrl+5".action = {
            move-column-to-workspace = 5;
          };
          "Mod+Ctrl+6".action = {
            move-column-to-workspace = 6;
          };
          "Mod+Ctrl+7".action = {
            move-column-to-workspace = 7;
          };
          "Mod+Ctrl+8".action = {
            move-column-to-workspace = 8;
          };
          "Mod+Ctrl+9".action = {
            move-column-to-workspace = 9;
          };

          "Mod+D".action = {
            switch-preset-column-width = { };
          };
          "Mod+Shift+R".action = {
            switch-preset-window-height = { };
          };
          "Mod+Ctrl+R".action = {
            reset-window-height = { };
          };
          "Mod+F".action = {
            maximize-column = { };
          };
          "Mod+Shift+F".action = {
            fullscreen-window = { };
          };
          "Mod+M".action = {
            maximize-window-to-edges = { };
          };
          "Mod+Ctrl+F".action = {
            expand-column-to-available-width = { };
          };
          "Mod+C".action = {
            center-column = { };
          };
          "Mod+Ctrl+C".action = {
            center-visible-columns = { };
          };
          "Mod+Minus".action = {
            set-column-width = "-10%";
          };
          "Mod+Equal".action = {
            set-column-width = "+10%";
          };

          "Mod+V".action = {
            toggle-window-floating = { };
          };
          "Mod+Shift+V".action = {
            switch-focus-between-floating-and-tiling = { };
          };
          "Mod+W".action = {
            toggle-column-tabbed-display = { };
          };

          "Print".action = {
            screenshot = { };
          };
          "Ctrl+Print".action = {
            screenshot-screen = { };
          };
          "Alt+Print".action = {
            screenshot-window = { };
          };

          "Mod+Escape" = {
            allow-inhibiting = false;
            action = {
              toggle-keyboard-shortcuts-inhibit = { };
            };
          };
          "Mod+Shift+E".action = {
            quit = { };
          };
          "Ctrl+Alt+Delete".action = {
            quit = { };
          };
          "Mod+Shift+P".action = {
            power-off-monitors = { };
          };
        };
    };
  };

  # home.sessionVariables = {
  #   GTK_THEME = "Adwaita:dark";
  #   QT_STYLE_OVERRIDE = "adwaita-dark";
  # };

  programs.kitty = {
    enable = true;

    settings = {
      hide_window_decorations = "yes";
      window_padding_width = 8;
    };
    font.name = "fira-code";
  };

  home.packages = with pkgs; [
    swayidle
    xwayland-satellite
    udiskie

    gnome-themes-extra

    nautilus
    mpv
    qimgv
    obs-studio
  ];

}
