{ pkgs, lib, ... }:
let
  databases = [
    "k3s"
    "gitea"
    "vaultwarden"
    "saysthbot"
    "hangitbot"
    "matrix"
  ];
in
{
  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    authentication = lib.mkForce ''
      host  all all 10.42.0.0/16  trust
      host  all all fd01::/56     trust
      local all all               peer
      host  all all 127.0.0.1/32  trust
      host  all all ::1/128       trust
    '';
    enableTCPIP = true;
    ensureDatabases = databases;
    ensureUsers = builtins.map (x: {
      name = x;
      ensureDBOwnership = true;
      ensureClauses = {
        login = true;
      };
    }) databases;
  };

  services.postgresqlBackup = {
    enable = true;
    databases = databases;
    compressionLevel = 9;
    location = "/backup/postgresql";
    startAt = "*-*-* 01:15:00";
  };
}
