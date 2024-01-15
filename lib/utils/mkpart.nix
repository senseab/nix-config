{ lib, ... }:
let
  defaultBtrfsOptions = [
    "compress=zstd"
    "x-gvfs-hide"
    "relatime"
    #"noatime"
    #"discard"
    #"ssd"
  ];

  ESPConfig = rec {
    priority = 1;
    name = "ESP";
    label = name;
    type = "EF00"; # EFI System Partition, aka ESP.
    size = "512M";
    content = {
      type = "filesystem";
      format = "vfat";
      mountpoint = "/boot";
      mountOptions = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };

  OSName = "NixOS";
in
{
  btrfs =
    {
      mountOptions ? defaultBtrfsOptions,
      systemConfig ? { },
      persistencePath ? "",
    }:
    {
      type = "gpt";
      partitions = {
        ESP = ESPConfig;
        nixos = {
          name = OSName;
          label = OSName;
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes =
              {
                "@store" = {
                  mountpoint = "/nix/store";
                  inherit mountOptions;
                };

                "@var" = {
                  mountpoint = "/nix/var";
                  inherit mountOptions;
                };

                "@.snapshots" = {
                  mountpoint = "/.snapshots";
                  inherit mountOptions;
                };
              }
              // lib.optionalAttrs (persistencePath != "") {
                "@persistent" = {
                  mountpoint = persistencePath;
                  inherit mountOptions;
                };
              }
              // lib.optionalAttrs (systemConfig ? swapSize) {
                "@swap" = {
                  mountpoint = "/.swapvol";
                  swap = {
                    swapfile.size = systemConfig.swapSize;
                  };
                };
              };
          };
        };
      };
    };

  ext4 =
    {
      mountOptions ? [ "defaults" ],
      systemConfig ? { },
    }:
    {
      type = "gpt";
      partitions = {
        ESP = ESPConfig;
        swap = lib.mkIf (systemConfig ? swapSize) {
          size = systemConfig.swapSize;
          content = {
            type = "swap";
            resumeDevice = true;
          };
        };

        nixos = {
          name = OSName;
          label = OSName;
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/nix";
            inherit mountOptions;
          };
        };
      };
    };
}
