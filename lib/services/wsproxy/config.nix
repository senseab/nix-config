{lib, import, ...}: with lib; 
{
  cfg = (import ./common.nix).cfg;

  virtualisation.oci-containers = {
    backend = cfg.engine;

    containers.wsproxy = {
      login.username = cfg.username;
      login.passwordFile = cfg.passwordFile;
      login.registry = cfg.registry;
      image = "${cfg.image}:${cfg.version}";
      autoStart = cfg.autoStart;

      extraOptions = [
        "--network=host"
      ];

      environment = {
        CONFIG_LISTEN = cfg.listenAddress;
        CONFIG_PORT = cfg.port;
        CONFIG_NO_TLS_VERIFY = !cfg.checkTLS;
        CONFIG_ADDR = cfg.serverAddress;
        WSPROXY_MODE = cfg.mode;
      };
    };
  };
}