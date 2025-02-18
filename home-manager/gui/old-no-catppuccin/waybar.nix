{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "bottom";
      position = "top";
      height = 20; # Remove for auto
      margin = "0 6 0 6";
      spacing = 6;

      passthrough = true;
      mode = "dock";

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
        format = "{volume} {icon}";
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

    style = ''
      * {
      font-family:"Fira Code Light";
      color:#aaaaaa;
      min-height: 20px;
      min-width:20px;
      font-size:14;
      }

      .module {
      border: solid 2px rgba(51, 102, 85, 0.66);
      border-radius: 10px;
      background: rgba(0,0,0,0.4);
      transition: all .3s ease;
      padding-left: 10px;
      padding-right: 10px;
      }

      .module:hover {
      border-color: rgba(127, 255, 212, 0.9);
      background: rgba(0,0,0,0.5);
      color:#ffffff;
      }

      window#waybar {
      background: transparent;
      }

      window#waybar.hidden {
      opacity: 0.2;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
      box-shadow: inherit;
      text-shadow: inherit;
      background-color: rgba(127, 255, 212, 1);
      border:solid 2px  rgba(127, 255, 212, 0.9);
      border-radius: inherit;
      }

      #battery.charging {
      border-color: rgba(127, 255, 212, 0.9)
      }

      #battery.warning:not(.charging) {
      background-color: rgba(255,170,127,0.5);
      border-color: rgba(127, 255, 212, 0.9)
      }

      #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
      }

      #tray {
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: #ffffff;
      background: #383c4a;
      }

      @keyframes blink {
      to {
          background-color: #ffffff;
          color: #000000;
      }
      }
    '';
  };
}
