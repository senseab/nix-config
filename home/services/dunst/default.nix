{
  services.dunst = {
    enable = true;
    settings = import ./settings.nix;
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start dunst" ];
}
