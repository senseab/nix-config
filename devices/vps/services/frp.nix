{
  services.frp = {
    enable = true;
    role = "server";
    settings = {
      common = {
        bind_addr = "::";
        bind_port = 7000;
        authentication_method = "token";
        token = "2333333333";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 7000 ];
  networking.firewall.allowedUDPPorts = [ 34197 ];
}
