{ launcher, ... }:
let
  power-menu-xml = builtins.toFile "waybar-power-menu.xml" (builtins.readFile ./power_menu.xml);
in
{
  layer = "top";
  position = "top";
  height = 32;
  modules-left = [
    "custom/launcher"
    "hyprland/workspaces"
  ];
  modules-center = [ "hyprland/window" ];
  modules-right = [
    "backlight"
    "wireplumber"
    "cpu"
    "memory"
    "battery"
    #"network"
    "keyboard-state"
    "tray"
    "clock"
    #"custom/power"
  ];

  wireplumber = {
    tooltip = false;
    scroll-step = 5;
    format = "{icon}  {volume}%";
    format-muted = "{icon}  --";
    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; # wpctl?
    format-icons = {
      default = [
        ""
        ""
        ""
      ];
    };
  };

  "hyprland/window" = {
    format = "{}";
    separate-outputs = true;
    icon = true;
    icon-size = 16;
  };

  "hyprland/workspaces" = {
    format = "{icon}";
    on-click = "activate";
    format-icons = {
      "1" = "";
      "2" = "";
      "3" = "";
      "4" = "";
      "5" = "";
      "6" = "";
      "7" = "";
      "8" = "󰂮";
      "9" = "󱁤";
      "10" = "󰣖";
      urgent = "";
      #active = "";
      default = "";
    };
    sort-by-number = true;
    all-outputs = true;
    persistent_workspaces = {
      "*" = 5;
    };
  };

  network = {
    tooltip = false;
    format-wifi = "  {essid}";
    format-ethernet = "󰛳  {ipaddr}/{cidr}";
    format-disconnected = "󰲜  --";
  };

  backlight = {
    tooltip = false;
    format = "  {}%";
    interval = 1;
    on-scroll-up = "light -A 5";
    on-scroll-down = "light -U 5";
  };

  battery = {
    states = {
      good = 95;
      warning = 30;
      critical = 20;
    };
    format = "{icon}\t{capacity}%";
    format-charging = "  {capacity}%";
    format-plugged = "  {capacity}%";
    format-alt = "{time}  {icon}";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
    ];
  };

  tray = {
    icon-size = 24;
    spacing = 10;
  };

  clock = {
    format = "  {:%H:%M}";
    tooltip-format = "<span size='9pt' font='monospace'>{calendar}</span>";
    calendar = {
      mode = "month";
      weeks-pos = "right";
      format = {
        months = "<span color='#ffead3' font='monospace'><b>{}</b></span>";
        days = "<span color='#ecc6d9' font='monospace'><b>{}</b></span>";
        weeks = "<span color='#99ffdd' font='monospace'><b>W{}</b></span>";
        weekdays = "<span color='#ffcc66' font='monospace'><b>{}</b></span>";
        today = "<span color='#ff6699' font='monospace'><b><u>{}</u></b></span>";
      };
    };
  };

  cpu = {
    interval = 15;
    format = "  {}%";
    max-length = 10;
  };

  memory = {
    interval = 30;
    format = "  {}%";
    max-length = 10;
  };

  "custom/launcher" = {
    format = " ";
    on-click = "${launcher}";
    tooltip = false;
  };

  "custom/power" = {
    format = "󰐥 ";
    tooltip = false;

    menu = "on-click";
    menu-file = "${power-menu-xml}";
    menu-actions = {
      shutdown = "shutdown";
      reboot = "reboot";
      suspend = "systemctl suspend";
      hibernate = "systemctl hibernate";
    };
  };

  "keyboard-state" = {
    numlock = true;
    capslock = true;
    format = "{icon}  {name}";
    format-icons = {
      "locked" = "";
      "unlocked" = "";
    };
  };
}
