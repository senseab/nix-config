{ launcher, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.mainBar = (import ./waybar-config.nix { inherit launcher pkgs; });
    style = (builtins.readFile ./waybar-style.css);
  };
}
