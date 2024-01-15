{ fqdn, ... }:
let
  installScript = builtins.toFile "deploy.sh" (builtins.readFile ./deploy.sh);
in
{
  services.nginx.virtualHosts."get.${fqdn}" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      return = "301 /deploy.sh";
    };

    locations."=/deploy.sh" = {
      alias = "${installScript}";
    };
  };
}
