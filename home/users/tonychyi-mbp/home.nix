{pkgs, ...}: {
  home.packages = with pkgs; [
    # darwin has no gnu tools
    coreutils
    gnutar
    gnused
    
    # might used for linux
    jdk17
    arduino-cli
  ];

  home.shellAliases = {
    cao = "fuck";
    nixos-rebuild = "darwin-rebuild";
    pip = "pip3";
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$GOPATH/bin"
  ];
}