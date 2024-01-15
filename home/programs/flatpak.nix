{ config, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    sockets=wayland
    filesystems=/nix/store:ro;~/.icons;~/.local/share/fonts;
  '';
  home.file.".local/share/fonts".source = link /run/current-system/sw/share/X11/fonts;
}
