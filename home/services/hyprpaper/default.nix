{ pkgs, lib, ... }:
let
  inherit (import ../../../lib/utils/path.nix { inherit pkgs lib; }) toStore;
  wallpapers = toStore "custom-wallpapers" ../../../assets/wallpapers;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      preload = wallpapers;
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start hyprpaper.service" ];
}
