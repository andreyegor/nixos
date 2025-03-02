{
  wayland.windowManager.hyprland = {
    enable = true;
    #package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 1
      shell fish
    '';
  };

  programs.fish.enable = true;
  programs.rofi.enable = true;

  wayland.windowManager.hyprland.settings = {
    #Screen
    monitor = [
      ",1920x1080@60,auto,1.25"
      "tv,3840x2160@60,auto,auto"
    ];

    "xwayland:force_zero_scaling" = true;

    #My programs
    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "rofi -show drun";

    #Autostart
    exec-once = [
      "sleep 1; hyprlock"
      "hypridle"
      "waybar"
      "asusctl profile -P quiet"
    ];

    #Environment variables
    env = [
      #"XCURSOR_SIZE,16"
      #"HYPRCURSOR_SIZE,16"
    ];

    #Look and feel
    general = {
      gaps_in = 3;
      gaps_out = 6;
      border_size = 0;
      resize_on_border = true;
      #https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = 5;
      active_opacity = 1.0;
      inactive_opacity = 1.0;

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    #https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    "master:new_status" = "master";

    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };

    #Input
    input = {
      kb_layout = "us, ru";
      kb_options = "grp:win_space_toggle";
      follow_mouse = 1;
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.55;
      };
    };

    gestures = {
      workspace_swipe = true;
    };

    #Keybindings
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      #My binds
      "$mainMod, L, exec, hyprlock"
      ", Print, exec, hyprshot -m region -o ~/hyprshots"

      #My asus binds
      ", 0x1008ff41, exec, $menu #rog button, menu"
      ", 0x1008ff13, exec, pactl -- set-sink-volume 0 +10%"
      ", 0x1008ff11, exec, pactl -- set-sink-volume 0 -10%"
      ", 0x1008ffb2, exec, pactl set-source-mute 1 toggle"
      ", 0x1008ff02, exec, brightnessctl s +10%"
      ", 0x1008ff03, exec, brightnessctl s 10%-"
      ", 0x1008ff05, exec, asusctl -n"
      ", 0x1008ff06, exec, asusctl -p"
      ", 0x1008ff44, exec, asusctl profile -n"

    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "bindm = $mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    #Windows and worckspaces
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

  };
}
