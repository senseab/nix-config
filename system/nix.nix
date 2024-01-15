{lib, ...}: {    
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.substituters = lib.mkForce [
    "https://mirrors.ustc.edu.cn/nix-channels/store" # 中科大
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" #清华
    "https://mirrors.bfsu.edu.cn/nix-channels/store" # 北外
    "https://mirror.sjtu.edu.cn/nix-channels/store" #交大
    #"https://cache.nixos.org/"
  ];

  services.nix-daemon.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
}