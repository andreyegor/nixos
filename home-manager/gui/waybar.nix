{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar-style.css;
  };

  programs.waybar.settings.mainBar = {
    layer = "bottom";
    position = "top";
    margin = "5 5 0 5";
    
    modules-left = [
      "hyprland/language"
    ];

    modules-center = [ "clock" ];

    modules-right = [
      "network"
      "bluetooth"
      "pulseaudio"
      "battery"
    ];

    "hyprland/language" = {
      tooltip = false;
      format = "{}";
      format-en = "en";
      format-ru = "ru";

    };

    clock = {
      format = "{:%b %d | %H:%M}";
    };

    network = {
      format-wifi = "{signalStrength}%  ";
      format-ethernet = "";
      format-disconnected = "";
      tooltip-format-disconnected = "Error";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname} 🖧 ";
    };

    bluetooth = {
      format-on = "󰂯";
      format-off = "BT-off";
      format-disabled = "󰂲";
      format-connected-battery = "{device_battery_percentage}% 󰂯";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
    };

    pulseaudio = {
      format = "{volume}% {icon}";
      format-bluetooth = "{volume} ";
      format-icons = {
        headphones = "";
        handsfree = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = " ";
      };
    };

    battery = {
      interval = 5;
      states = {
        good = 90;
        warning = 30;
        critical = 15;
      };

      format = "{capacity}% {icon}";
      format-charging = "{capacity}% 󰂄";
      format-plugged = "{capacity}% ";
      format-alt = "{time} {icon}";
      format-icons = [
        "󰁻"
        "󰁼"
        "󰁾"
        "󰂀"
        "󰂂"
        "󰁹"
      ];
    };
  };
}
