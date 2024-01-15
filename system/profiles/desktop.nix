# Desktop profiles here.
{ persistencePath, pkgs, ... }:
{
  imports = [
    ./common.nix

    ../settings/fonts.nix
    ../settings/audio.nix
    ../settings/wayland.nix
    ../settings/flatpak.nix
    ../settings/appimage.nix
    ../settings/home-manager.nix
    ../settings/btrfs.nix
    ../settings/waydroid.nix
  ];
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  boot.initrd.verbose = false;
  boot.plymouth.enable = true;
  networking.networkmanager.enable = true;
  hardware.opengl.enable = true;
  # improve desktop responsiveness when updating the system
  nix.daemonCPUSchedPolicy = "idle";

  # use NetworkManager.
  environment.persistence."${persistencePath}".directories = [
    "/etc/NetworkManager/system-connections"
  ];
  environment.systemPackages = with pkgs; [ gnome.adwaita-icon-theme ];

  # preload files for better performance.
  services.preload.enable = true;

  # use gvfs for removable media.
  services.gvfs.enable = true;

  # power management.
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };

  services.printing.enable = true;

  programs.light.enable = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
  };
}
