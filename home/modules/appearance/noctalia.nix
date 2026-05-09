{
  config,
  pkgs,
  ...
}:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 59;

      general = {
        avatarImage = "/home/egor/Pictures/me.jpg";
        language = "en";
        telemetryEnabled = false;
        animationSpeed = 1;
        enableShadows = false;
        enableBlurBehind = false;
        radiusRatio = 1;
        boxRadiusRatio = 1;
        iRadiusRatio = 1;
        screenRadiusRatio = 1;
        lockOnSuspend = true;
        compactLockScreen = false;
        allowPasswordWithFprintd = true;
        clockStyle = "custom";
        clockFormat = "hh\\nmm";
        dimmerOpacity = 0.0;
        smoothScrollEnabled = true;
        showSessionButtonsOnLockScreen = false;
        enableLockScreenCountdown = false;
        passwordChars = true;
      };

      colorSchemes = {
        darkMode = true;
        predefinedScheme = "Catppuccin";
        generationMethod = "fruit-salad";
        schedulingMode = "off";
        syncGsettings = true;
        useWallpaperColors = false;
      };

      appLauncher = {
        position = "center";
        viewMode = "list";
        iconMode = "tabler";
        density = "default";
        sortByMostUsed = true;
        showCategories = true;
        terminalCommand = "kitty -e";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWrapText = true;
        enableClipPreview = true;
        enableClipboardChips = true;
        enableClipboardSmartIcons = true;
        enableSettingsSearch = false;
        overviewLayer = true;
      };

      audio = {
        spectrumFrameRate = 30;
        visualizerType = "linear";
        volumeStep = 5;
        volumeOverdrive = false;
        volumeFeedback = false;
      };

      bar = {
        position = "top";
        barType = "simple";
        showCapsule = false;
        backgroundOpacity = 1;
        marginHorizontal = 4;
        marginVertical = 4;
        frameRadius = 12;
        frameThickness = 8;
        widgetSpacing = 6;
        contentPadding = 2;
        displayMode = "always_visible";
        rightClickAction = "controlCenter";
        rightClickFollowMouse = true;
        outerCorners = true;
        useSeparateOpacity = true;
        showOnWorkspaceSwitch = true;
        enableExclusionZoneInset = true;
        screenOverrides = [
          {
            name = "HDMI-A-1";
            enabled = false;
          }
        ];
        widgets = {
          left = [
            {
              id = "Launcher";
              icon = "rocket";
              useDistroLogo = false;
              iconColor = "none";
              enableColorization = false;
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              tooltipFormat = "HH:mm ddd, MMM dd";
              clockColor = "none";
              useCustomFont = false;
            }
            {
              id = "SystemMonitor";
              compactMode = true;
              diskPath = "/";
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              showSwapUsage = true;
              useMonospaceFont = true;
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "MediaMini";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = true;
              visualizerType = "linear";
              maxWidth = 200;
              useFixedWidth = true;
              scrollingMode = "hover";
              hideMode = "hidden";
              panelShowAlbumArt = true;
              textColor = "none";
            }
          ];
          center = [
            {
              id = "Workspace";
              labelMode = "index";
              fontWeight = "bold";
              pillSize = 0.6;
              iconScale = 0.8;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              enableScrollWheel = true;
              focusedColor = "primary";
              occupiedColor = "secondary";
              emptyColor = "secondary";
              groupedBorderOpacity = 1;
              unfocusedIconsOpacity = 1;
            }
          ];
          right = [
            {
              id = "plugin:privacy-indicator";
              defaultSettings = {
                activeColor = "primary";
                enableToast = true;
                hideInactive = false;
                iconSpacing = 4;
                inactiveColor = "none";
              };
            }
            {
              id = "Tray";
              drawerEnabled = true;
              hidePassive = false;
              colorizeIcons = false;
              chevronColor = "none";
            }
            {
              id = "KeyboardLayout";
              displayMode = "forceOpen";
              showIcon = false;
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              iconColor = "none";
            }
            {
              id = "Volume";
              displayMode = "onhover";
              middleClickCommand = "pwvucontrol || pavucontrol";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Bluetooth";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Network";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Battery";
              displayMode = "graphic-clean";
              hideIfNotDetected = true;
              hideIfIdle = false;
              deviceNativePath = "__default__";
            }
            {
              id = "ControlCenter";
              icon = "noctalia";
              useDistroLogo = true;
              enableColorization = false;
            }
          ];
        };
      };

      dock = {
        enabled = false;
      };

      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        cards = [
          {
            id = "profile-card";
            enabled = true;
          }
          {
            id = "shortcuts-card";
            enabled = true;
          }
          {
            id = "audio-card";
            enabled = true;
          }
          {
            id = "brightness-card";
            enabled = true;
          }
          {
            id = "weather-card";
            enabled = true;
          }
          {
            id = "media-sysmon-card";
            enabled = true;
          }
        ];
        shortcuts = {
          left = [
            { id = "Network"; }
            { id = "Bluetooth"; }
            { id = "WallpaperSelector"; }
            { id = "NoctaliaPerformance"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
            { id = "AirplaneMode"; }
          ];
        };
      };

      calendar = {
        cards = [
          {
            id = "calendar-header-card";
            enabled = true;
          }
          {
            id = "calendar-month-card";
            enabled = true;
          }
          {
            id = "weather-card";
            enabled = true;
          }
        ];
      };

      notifications = {
        enabled = true;
        location = "top_right";
        overlayLayer = true;
        density = "default";
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        enableBatteryToast = true;
        clearDismissed = true;
        saveToHistory = {
          critical = true;
          normal = true;
          low = true;
        };
        sounds.enabled = false;
        enableKeyboardLayoutToast = false;
      };

      nightLight = {
        enabled = true;
        autoSchedule = true;
        dayTemp = "6500";
        nightTemp = "5000";
      };

      idle = {
        enabled = true;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
        customCommands = "[]";
      };

      osd = {
        enabled = true;
        location = "top_right";
        overlayLayer = true;
        autoHideMs = 2000;
        enabledTypes = [
          0
          1
          2
        ];
      };

      brightness = {
        brightnessStep = 5;
        enableDdcSupport = false;
        enforceMinimum = true;
      };

      network = {
        bluetoothAutoConnect = true;
        bluetoothDetailsViewMode = "grid";
        wifiDetailsViewMode = "grid";
      };

      sessionMenu = {
        position = "top_right";
        largeButtonsStyle = false;
        showHeader = true;
        showKeybinds = false;
        enableCountdown = false;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
            keybind = "1";
            countdownEnabled = true;
          }
          {
            action = "suspend";
            enabled = true;
            keybind = "2";
            countdownEnabled = true;
          }
          {
            action = "hibernate";
            enabled = true;
            keybind = "3";
            countdownEnabled = true;
          }
          {
            action = "reboot";
            enabled = true;
            keybind = "4";
            countdownEnabled = true;
          }
          {
            action = "logout";
            enabled = true;
            keybind = "5";
            countdownEnabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
            keybind = "6";
            countdownEnabled = true;
          }
          {
            action = "rebootToUefi";
            enabled = true;
            keybind = "7";
            countdownEnabled = true;
          }
          {
            action = "userspaceReboot";
            enabled = false;
            keybind = "";
            countdownEnabled = true;
          }
        ];
      };

      ui = {
        fontDefault = "Sans Serif";
        fontFixed = "Fira Code";
        panelsAttachedToBar = true;
        tooltipsEnabled = true;
        translucentWidgets = false;
        panelBackgroundOpacity = 1.0;
      };

      wallpaper = {
        enabled = true;
        directory = "/home/egor/Pictures/Wallpapers";
        fillMode = "crop";
        wallpaperChangeMode = "random";
        sortOrder = "date_desc";
        transitionType = [ "fade" ];
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        showHiddenFiles = true;
        hideWallpaperFilenames = true;
        linkLightAndDarkWallpapers = true;
        randomIntervalSec = 300;
        solidColor = "#1a1a2e";
        fillColor = "#000000";
      };

      noctaliaPerformance = {
        disableDesktopWidgets = true;
        disableWallpaper = true;
      };

      plugins = {
        autoUpdate = false;
        notifyUpdates = true;
      };
    };
  };

  home.packages = with pkgs; [
    brightnessctl
    playerctl
    pamixer

    resources
  ];
}
