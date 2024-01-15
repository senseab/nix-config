{ pkgs, ... }:
{
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    wget
    axel
    curl
    icdiff
    kubectl
    krew
    kube-capacity
    kubernetes-helm
  ];

  home.shellAliases = {
    top = "btop";
    cat = "bat -pp";
    diff = "icdiff";
  };

  home.sessionPath = [ "$HOME/.local/bin" ];
}
