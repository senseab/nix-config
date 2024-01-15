{ defaultTerminal, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "${defaultTerminal}";
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [ rofi-file-browser ];

    theme = ./theme.rasi;
  };
}
