{
  # Wayland configs
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_QPA_PLATFORM = "wayland";
  environment.sessionVariables.SDL_VIDEODRIVER = "wayland";

  programs.xwayland.enable = true;
  #programs.uwsm.enable = true;
}
