{
  services.nginx.virtualHosts."m.sense-t.eu.org" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://localhost:9342";
    };
  };
}
