{ lib, config, ... }:
let
  inherit (lib)
    mkIf
    mkDefault
    optionals
    concatLists
    ;
  cfg = config.services.crproxy;
  allowImageListFile = builtins.toFile "crproxy-allow-image-list" (
    lib.strings.concatLines cfg.allowImageList
  );
  useAllowImageList = (lib.length cfg.allowImageList) != 0;
  blockIPListFile = builtins.toFile "crproxy-block-ip-list" (lib.strings.concatLines cfg.blockIPList);
  useBlockIPList = (lib.length cfg.blockIPList) != 0;
in
{
  config = mkIf cfg.enable {
    virtualisation.oci-containers.backend = mkDefault cfg.engine;
    virtualisation.oci-containers.containers.crproxy = {
      image = "${cfg.image}:${cfg.version}";
      autoStart = cfg.autoStart;

      extraOptions = [ "--network=host" ];

      cmd = concatLists [
        [
          "--default-registry=${cfg.defaultRegistry}"
          "--address=${cfg.listenAddress}"
        ]
        (optionals useAllowImageList [ "--allow-image-list-from-file=${allowImageListFile}" ])
        (optionals useAllowImageList [ "--block-message=${cfg.blockMessage}" ])
        (optionals useBlockIPList [ "--block-ip-list-from-file=${blockIPListFile}" ])
        (optionals cfg.simpleAuth [ "--simple-auth" ])
        (optionals cfg.behindProxy [ "--behind" ])
        (map (e: "--allow-host-list=${e}") cfg.allowHostList)
        (map (e: "--privileged-ip-list=${e}") cfg.privilegedIPList)
        (map (e: "--user=${e}") cfg.userpass)

        cfg.extraOptions
      ];
    };
  };
}
