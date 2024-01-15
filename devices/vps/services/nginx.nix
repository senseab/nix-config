{ fqdn, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "tonychee1989@gmail.com";
      reloadServices = [ "nginx" ];
    };
  };

  services.nginx.enable = true;
  services.nginx.virtualHosts."${fqdn}" = {
    serverAliases = [ "www.${fqdn}" ];
    forceSSL = true;
    enableACME = true;
    default = true;
    root = "/var/www/html";
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
