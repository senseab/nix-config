{ pkgs, ... }:
{
  programs.regreet.enable = true;

  programs.hyprland = {
    enable = true;
    #withUWSM = true;
    xwayland = {
      enable = true;
    };
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };
}
