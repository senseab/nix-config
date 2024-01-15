{
  programs.timidity.enable = true;
  programs.timidity.extraConfig = (builtins.readFile ./config/timidity.cfg);
}
