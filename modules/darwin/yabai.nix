{ pkgs, pkgsUnstable, ... }:
{
  services.yabai = {
    enable = true;
    package = pkgsUnstable.yabai;

    config = {
      layout = "bsp";
      window_placement = "second_child";

      window_gap = 10;
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;

      auto_balance = "off";
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";

      window_animation_duration = 0.15;
      window_animation_easing = "ease_out_circ";
    };

    extraConfig = ''
      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
    '';
  };

  security.sudo.extraConfig = ''
    %admin ALL=(root) NOPASSWD: sha256:* /run/current-system/sw/bin/yabai --load-sa
  '';

  system.defaults = {
    dock.mru-spaces = false;
    spaces.spans-displays = false;
    finder.CreateDesktop = true;
    WindowManager.EnableStandardClickToShowDesktop = false;
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      alt - s : open -a Terminal

      alt - q : yabai -m window --close
      alt - f : yabai -m window --toggle zoom-fullscreen
      alt - v : yabai -m window --toggle float

      alt - 0x1B : yabai -m window --resize right:-100:0
      alt - 0x18 : yabai -m window --resize right:100:0
      alt + shift - 0x1B : yabai -m window --resize bottom:0:-100
      alt + shift - 0x18 : yabai -m window --resize bottom:0:100

      alt - left  : yabai -m window --focus west
      alt - right : yabai -m window --focus east
      alt - up    : yabai -m window --focus north
      alt - down  : yabai -m window --focus south

      alt + shift - left  : yabai -m window --swap west
      alt + shift - right : yabai -m window --swap east
      alt + shift - up    : yabai -m window --swap north
      alt + shift - down  : yabai -m window --swap south

      alt + ctrl - left  : yabai -m display --focus west
      alt + ctrl - right : yabai -m display --focus east

      alt + shift + ctrl - left  : yabai -m window --display west --focus
      alt + shift + ctrl - right : yabai -m window --display east --focus

      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9

      alt + shift - 1 : yabai -m window --space 1
      alt + shift - 2 : yabai -m window --space 2
      alt + shift - 3 : yabai -m window --space 3
      alt + shift - 4 : yabai -m window --space 4
      alt + shift - 5 : yabai -m window --space 5
      alt + shift - 6 : yabai -m window --space 6
      alt + shift - 7 : yabai -m window --space 7
      alt + shift - 8 : yabai -m window --space 8
      alt + shift - 9 : yabai -m window --space 9
    '';
  };
}
