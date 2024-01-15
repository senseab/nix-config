{ pkgs, ... }:
{
  services.flatpak.enable = true;

  programs.dconf.enable = true;

  xdg.portal.enable = true;
  xdg.portal.config.common.default = "*";

  # common option
  # use lib.mkForce change it to kde in devices or specified user.
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
}
