{ username, ... }:
{
  system.stateVersion = "23.05";
  imports = [
    ./config.nix
    ./hardware-configuration.nix
    ./disko-config.nix
    ../../users/user
    ../../system/profiles/desktop.nix
    ../../system/desktop-env/hyprland.nix
  ];

  # per device config
  home-manager.users."${username.desktop}" = {
    imports = [ ./home-manager ];
  };
}
