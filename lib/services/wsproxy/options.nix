{ lib, config, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
  defaultRegistry = "ghcr.io";
in
{
  options = {
    services.wsproxy = {
      enable = mkEnableOption "WSProxy - a simple websocket proxy.";
      engine = mkOption {
        type = types.str;
        default = "podman";
      };

      version = mkOption {
        type = types.str;
        default = "master";
      };

      image = mkOption {
        type = types.str;
        default = "${defaultRegistry}/senseab/wsproxy";
      };

      registry = mkOption {
        type = types.str;
        default = defaultRegistry;
      };

      username = mkOption {
        type = types.str;
        default = "senseab";
      };

      passwordFile = mkOption {
        type = types.str;
        default = "";
      };

      autoStart = mkOption {
        type = types.bool;
        default = true;
      };

      checkTLS = mkOption {
        type = types.bool;
        default = true;
      };

      listenAddress = mkOption {
        type = types.str;
        default = "[::1]";
      };

      serverAddress = mkOption {
        type = types.str;
        default = "wss://dev.sense-t.eu.org/path";
      };

      mode = mkOption {
        type = types.enum [
          "server"
          "client"
        ];
        default = "client";
      };

      port = mkOption {
        type = types.port;
        default = 1089;
      };

      useProxychains = mkOption {
        type = types.bool;
        default = config.services.wsproxy.mode == "client";
      };
    };
  };
}
