{
  system.stateVersion = "23.05";
  imports = [
    ./hardware-configuration.nix
    ./services

    ../../system/profiles/server.nix
    ../../users/login
  ];
}
