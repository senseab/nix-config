{ lib, modulesPath, ... }:
{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" ];

    loader.grub = {
      configurationLimit = 10;
      enable = true;
      device = "/dev/sda";
    };

    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "sr_mod"
        "virtio_blk"
      ];
    };

    kernel.sysctl = {
      "net.ipv6.conf.all.disable_ipv6" = 0;
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv6.conf.all.forwarding" = 1;
      "net.ipv4.conf.all.forwarding" = 1;
      "fs.inotify.max_user_watches" = 524288;
      "kernel.panic" = 10;
      "kernel.nmi_watchdog" = 1;
    };
  };

  fileSystems."/boot" = {
    device = "/dev/sda1";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
    # lvm
    device = "/dev/sda3";
    fsType = "ext4";
  };

  swapDevices = [ { device = "/dev/sda2"; } ];

  networking.hostName = "vps";
  networking.domain = "wetofu.me";
  networking.useDHCP = lib.mkDefault true;
}
