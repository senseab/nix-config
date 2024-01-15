{
  lib,
  config,
  fqdn,
  ...
}:
{
  services.headscale = {
    enable = true;
    address = "localhost";
    port = 8081;
    settings = {
      #unix_socket = lib.mkForce "/var/run/headscale.sock";
      server_url = "https://hs.${fqdn}";
      dns_config = {
        nameservers = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        base_domain = "233.local";
      };
      ip_prefixes = [
        "100.64.233.0/24"
        "fd7a:115c:a1e0::/48"
      ];
    };
  };

  services.nginx.virtualHosts."hs.${fqdn}" = lib.mkIf config.services.headscale.enable {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      recommendedProxySettings = true;
      proxyWebsockets = true;
      proxyPass = "http://localhost:8081";
    };
  };

  networking.firewall.allowedUDPPorts = lib.mkIf config.services.headscale.enable [
    3478
    41641
  ];
}
