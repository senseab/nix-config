{ pkgs, persistencePath, ... }:
{
  environment.variables.CONTAINERD_NAMESPACE = "k8s.io";
  environment.variables.CONTAINERD_ADDRESS = "/run/k3s/containerd/containerd.sock";

  environment.persistence."${persistencePath}".directories = [ "/etc/rancher" ];

  services.k3s = {
    enable = true;
    #package = pkgs-unstable.k3s_1_29;
    configPath = "/etc/rancher/k3s/config.yaml";
  };

  environment.systemPackages = with pkgs; [ nerdctl ];

  networking.firewall.allowedTCPPorts = [
    6443
    9100 # node_exporter
    2333 # coder ssh
    1935 # rtmp
    8118 # http proxy
    1080 # socks proxy

    9091 # transmission
    9092 # webdav
    51413 # transmission
  ];
}
