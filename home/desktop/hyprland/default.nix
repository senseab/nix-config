{ defaultTerminal, ... }:
let
  rofiCommand = mode: "rofi -show ${mode} -show-icons";
  launcher = rofiCommand "drun";
  terminal = defaultTerminal;
  window = rofiCommand "window";
  filebrowser = rofiCommand "filebrowser";
in
{
  _module.args.launcher = launcher;

  imports = [
    ../../services/dunst
    ../../services/clipman.nix
    ../../services/hyprpaper
    ../../programs/rofi
    ../../programs/waybar
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enableXdgAutostart = true;
    xwayland.enable = true;

    settings = (import ./settings.nix) {
      inherit
        launcher
        terminal
        window
        filebrowser
        ;
    };
  };
}
