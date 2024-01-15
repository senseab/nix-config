{ lib, hostPlatform, ... }:
{
  imports = [ ];

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "mptspi"
    "uhci_hcd"
    "ehci_pci"
    "ahci"
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
  #boot.initrd.systemd.enable = true;
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  #boot.resumeDevice = "/.swapvol/swapfile";

  /*
    fileSystems."/" = {
      device = "tmpfs";
      fsType = "tmpfs";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/0D50-8D20";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    fileSystems."/nix/store" = {
      device = "/dev/disk/by-uuid/430808a4-192f-499e-8cad-fa9e3b980aa8";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=store"
      ];
    };

    fileSystems."/nix/var" = {
      device = "/dev/disk/by-uuid/430808a4-192f-499e-8cad-fa9e3b980aa8";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=var"
      ];
    };

    fileSystems."${persistencePath}" = {
      device = "/dev/disk/by-uuid/430808a4-192f-499e-8cad-fa9e3b980aa8";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=persistant"
      ];
      neededForBoot = true;
    };
  */

  #swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault hostPlatform;

  # running in vmware
  virtualisation.vmware.guest.enable = true;
}
