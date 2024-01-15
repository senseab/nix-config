{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nix
    procps
    nixd
    coreutils
    proxychains
    gnugrep
    nixfmt-rfc-style
    elinks
  ];

  home.file = {
    ".cargo/config".source = ./files/cargo/cargo-config;
    ".profile".source = ./files/profile/profile;
    ".config/proxychains-ng/proxychains.conf".source = ./files/proxychains/proxychains.conf;
    ".bashrc".text = "source .profile";
  };

  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";
    GOPROXY = "https://goproxy.cn,direct";
    PKG_CONFIG_PATH = "$HOME/.nix-profile/lib/pkgconfig";
    # electron wayland support
    #NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = [ "$HOME/.cargo/bin" ];

  targets.genericLinux.enable = true;
}
