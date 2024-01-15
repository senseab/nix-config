{pkgs, lib, ...}: {
  home.stateVersion = "23.11";
  home.packages = with pkgs; lib.mkDefault [
    wget
    axel
    curl
    icdiff
    kubectl
    krew
    kube-capacity
    kubernetes-helm
  ];

  home.shellAliases = lib.mkDefault {
    top = "htop";
    cat = "bat -p --paging=never -u";
    diff = "icdiff";
  };

  home.sessionPath = lib.mkDefault [
    "$HOME/.local/bin"
  ];
}