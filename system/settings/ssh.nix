{ lib, persistencePath, ... }:
{
  environment.persistence."${persistencePath}".files = lib.mkAfter [
    "/etc/ssh/ssh_host_ed25519_key.pub"
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_rsa_key.pub"
    "/etc/ssh/ssh_host_rsa_key"
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.fail2ban = {
    enable = true;
    bantime = "1h";
    bantime-increment = {
      enable = true;
      maxtime = "72h";
    };
  };
}
