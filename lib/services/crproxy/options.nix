{ lib, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
  defaultImage = "ghcr.io/daocloud/crproxy/crproxy";
in
{
  options = {
    services.crproxy = {
      enable = mkEnableOption "CRProxy (Container Registry Proxy) is a generic image proxy";

      engine = mkOption {
        type = types.str;
        default = "podman";
      };

      version = mkOption { type = types.str; };

      image = mkOption {
        type = types.str;
        default = defaultImage;
      };

      autoStart = mkOption {
        type = types.bool;
        default = true;
      };

      listenAddress = mkOption {
        default = ":8080";
        type = types.str;
      };

      behindProxy = mkOption {
        default = false;
        type = types.bool;
      };

      userpass = mkOption {
        default = [ ];
        type = types.listOf types.str;
      };

      allowHostList = mkOption {
        default = [ ];
        type = types.listOf types.str;
      };

      allowImageList = mkOption {
        default = [ ];
        type = types.listOf types.str;
      };

      blockMessage = mkOption {
        type = types.str;
        default = "This image is not allowed for my proxy!";
      };

      blockIPList = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };

      defaultRegistry = mkOption {
        type = types.str;
        default = "docker.io";
      };

      simpleAuth = mkOption {
        type = types.bool;
        default = false;
      };

      privilegedIPList = mkOption {
        default = [ ];
        type = types.listOf types.str;
      };

      extraOptions = mkOption {
        default = [ ];
        type = types.listOf types.str;
        description = ''
          see https://github.com/DaoCloud/crproxy/blob/master/cmd/crproxy/main.go for more.
        '';
      };
    };
  };
}
