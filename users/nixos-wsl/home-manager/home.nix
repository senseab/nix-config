{ pkgs, ... }:
{
  home.packages = with pkgs; [ nixd ];

  gtk.enable = true;
  gtk.iconTheme = {
    package = pkgs.iconpack-obsidian; # icon theme
    name = "Obsidian";
  };

  qt.enable = true;
  qt.platformTheme.name = "adwaita";
  qt.style.name = "adwaita";

  xdg.enable = true;
}
