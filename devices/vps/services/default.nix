{
  imports = [
    ./nginx.nix
    ./proxy.nix
    ./frp.nix
    ./headscale.nix
    ./crproxy.nix
    #./matrix.nix
    ./remote-install
  ];
}
