{ pkgs, ... }:
let
  fqdn = "wetofu.me";
in
{
  # inject variables.
  _module.args.fqdn = fqdn;

  system.stateVersion = "23.11";
  imports = [
    ./services
    ./hardware-configuration.nix
    ./firewall.nix

    ../../system/profiles/server.nix
    ../../users/login
  ];

  virtualisation.hypervGuest.enable = true;
  virtualisation.podman.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    btop
  ];
}
