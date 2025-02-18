{
  programs.hyprlock.enable = true;

  services.hypridle = {
    enable = true;
    settings.general = {
      before_sleep_cmd = "hyprlock"; # lock before suspend.
    };
  };

  programs.hyprlock.settings = {
    background = {
      path = "screenshot";
      #path = "/home/egor/.wallpapers/wall2.png";
      color = "rgb(264c40)";
      blur_passes = 2;
      contrast = 1;
      brightness = 0.5;
      vibrancy = 0.2;
      vibrancy_darkness = 0.2;
    };

    general = {
      no_fade_in = false;
      no_fade_out = false;
      hide_cursor = true;
      grace = 0;
      disable_loading_bar = false;
      immediate_render = true;
    };

    input-field = {
      size = "250, 60";
      outline_thickness = 2;
      dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true;
      outer_color = "rgba(0, 0, 0, 0.2)";
      inner_color = "rgba(0, 0, 0, 0)";
      font_color = "rgba(127,255,212,0.9)";
      fade_on_empty = false;
      rounding = -1;
      check_color = "rgb(127, 255, 212)";
      fail_color = "rgb(255, 170, 127)";
      fail_timeout = 2000;
      fail_transition = 300;
      placeholder_text = ''<i><span foreground="##444444">type password pls</span></i>'';
      hide_input = false;
      position = "0, -200";
      halign = "center";
      valign = "center";
    };

    label = [
      # date
      {
        text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
        color = "rgba(242, 243, 244, 0.75)";
        font_size = 22;
        font_family = "JetBrains Mono";
        position = "0, 300";
        halign = "center";
        valign = "center";
      }

      # time
      {
        text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
        color = ''rgba(242, 243, 244, 0.75)'';
        font_size = 95;
        font_family = "JetBrains Mono Extrabold";
        position = "0, 200";
        halign = "center";
        valign = "center";
      }

      # battery
      {
        text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
        color = "rgba(242, 243, 244, 0.75)";
        font_size = 95;
        font_family = "JetBrains Mono Extrabold";
        position = "0, 200";
        halign = "center";
        valign = "center";
      }

      # just bottom text
      {
        text = "hi";
        color = "rgba(255, 255, 255, 0.6)";
        font_size = 14;
        font_family = "Metropolis Light, Fira Code Light";
        position = "0, 50";
        halign = "center";
        valign = "bottom";
      }
    ];
  };
}
