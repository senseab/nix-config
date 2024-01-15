{ fqdn, ... }:
let
  port = 8082;
in
{
  services.crproxy = {
    enable = true;
    version = "v0.12.2";
    listenAddress = "[::1]:${toString port}";
    behindProxy = true;
  };

  services.nginx.virtualHosts."cr.${fqdn}" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://localhost:${toString port}";
    };
  };
}
