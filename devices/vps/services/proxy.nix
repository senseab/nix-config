{ fqdn, secret, ... }:
let
  ghcrPassword = builtins.toFile "ghcr-secret" secret.ghcr-secret;
  trojanPassword = secret.trojanPassword;
in
{
  services.wsproxy = {
    enable = true;
    passwordFile = "${ghcrPassword}";
    checkTLS = false;
    mode = "server";
  };

  services.v2ray = {
    enable = true;
    config = {
      outbounds = [ { protocol = "freedom"; } ];

      inbounds = [
        # trojan
        {
          port = 9081;
          protocol = "trojan";
          settings = {
            clients = [
              {
                password = trojanPassword;
                email = "someone@wetofu.me";
                level = 0;
              }
            ];
          };

          streamSettings = {
            network = "ws";
            security = "none";
            wsSettings.path = "/KnockOuts";
          };
        }
      ];
    };
  };

  services.nginx.virtualHosts."hi.${fqdn}" = {
    forceSSL = true;
    enableACME = true;
    locations."/path" = {
      recommendedProxySettings = true;
      proxyWebsockets = true;
      proxyPass = "http://localhost:1089";
    };

    # trojan
    locations."/KnockOuts" = {
      recommendedProxySettings = true;
      proxyWebsockets = true;
      proxyPass = "http://localhost:9081";
    };
  };
}
