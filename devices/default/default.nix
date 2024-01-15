{ lib, ... }:
{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  boot.loader.grub.enable = false;
  system.stateVersion = "23.11";

  imports = [
    ../../system/profiles/common.nix
    ../../users/user
  ];
}
