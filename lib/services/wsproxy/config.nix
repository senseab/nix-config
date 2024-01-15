{ lib, config, ... }:
let
  inherit (lib) mkDefault mkIf boolToString;
  cfg = config.services.wsproxy;
in
{
  config = mkIf cfg.enable {
    virtualisation.oci-containers.backend = mkDefault cfg.engine;
    virtualisation.oci-containers.containers.wsproxy = {
      login.username = cfg.username;
      login.passwordFile = cfg.passwordFile;
      login.registry = cfg.registry;
      image = "${cfg.image}:${cfg.version}";
      autoStart = cfg.autoStart;

      extraOptions = [ "--network=host" ];

      environment = {
        CONFIG_LISTEN = cfg.listenAddress;
        CONFIG_PORT = toString cfg.port;
        CONFIG_NO_TLS_VERIFY = boolToString (!cfg.checkTLS);
        CONFIG_ADDR = cfg.serverAddress;
        WSPROXY_MODE = cfg.mode;
      };
    };

    programs.proxychains = {
      enable = cfg.useProxychains;
      quietMode = true;
      proxies = {
        default = {
          type = "socks5";
          port = cfg.port;
          host = "localhost";
          enable = true;
        };
      };
    };
  };
}
