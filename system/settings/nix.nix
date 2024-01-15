{ lib, substituters, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.optimise.automatic = true;
  nix.settings.substituters = lib.mkForce substituters;
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 2w";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
}
