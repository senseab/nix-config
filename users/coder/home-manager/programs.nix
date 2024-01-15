{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    matchBlocks = {
      "git-ssh.sense-t.eu.org" = {
        hostname = "gitea.default";
      };
      "nas" = {
        hostname = "192.168.1.25";
        user = "rouji";
        port = 2334;
      };
      "vps" = {
        hostname = "206.237.9.138";
        user = "login";
      };
      "nuc" = {
        hostname = "host-ssh";
        user = "login";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Sense T";
    userEmail = "me@sense-t.eu.org";

    ignores = [
      ".DS_Store"
      "*~"
      "*.swp"
    ];

    extraConfig = {
      init = {
        defaultObjectFormat = "sha256";
        defaultRefFormat = "reftable";
      };

      merge = {
        tool = "vscode";
      };
    };
  };
}
