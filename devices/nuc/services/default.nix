{ lib, ... }:
{
  imports = [
    ./k3s.nix
    ./postgresql.nix
  ];

  services.fail2ban.enable = lib.mkForce false;
  services.tailscale.enable = true;
}
