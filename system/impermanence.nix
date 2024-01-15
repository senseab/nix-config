{
  # /nix/persistent 是你实际保存文件的地方
  environment.persistence."/nix/persistent" = {
    # 不让这些映射的 mount 出现在文件管理器的侧边栏中
    hideMounts = true;

    # 你要映射的文件夹
    directories = [
      "/etc/rancher"
      "/root"
      "/var"
    ];

    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
    ];
  };

  environment.variables.NIX_REMOTE = "daemon";

  systemd.services.nix-daemon = {
    environment = {
      # 指定临时文件的位置
      TMPDIR = "/var/cache/nix";
    };
    serviceConfig = {
      # 在 Nix Daemon 启动时自动创建 /var/cache/nix
      CacheDirectory = "nix";
    };
  };

  # Stateless rootfs
  fileSystems."/" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [ "relatime" "mode=755" "nosuid" "nodev" ];
  };
}
