{
  persistencePath,
  rootMountOptions,
  systemConfig,
  lib,
  ...
}:
let
  mountOptions = [
    "compress=zstd"
    "noatime"
    #"discard"
    #"ssd"
  ];

  inherit (import ../../lib/utils/mkpart.nix { inherit lib; }) btrfs;
in
{
  disko.devices = {
    disk.main = {
      # can be set by installer
      device = systemConfig.targetDisk;

      type = "disk";
      content = btrfs { inherit mountOptions systemConfig persistencePath; };
    };

    nodev."/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      mountOptions = rootMountOptions;
    };
  };
}
