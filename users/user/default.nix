{ pkgs, username, ... }:
{
  imports = [
    ../../system/settings/home-manager.nix
    ./userdir.nix
  ];

  security.sudo.wheelNeedsPassword = false;

  users.users."${username.desktop}" = {
    isNormalUser = true;
    description = "Default user for PC";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "video"
      "kvm"
      "keyd"
    ];
    hashedPassword = ""; # Login directly
    shell = pkgs.fish;
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  home-manager.users."${username.desktop}" = {
    home.username = username.desktop;
    home.homeDirectory = "/home/${username.desktop}";
    imports = [ ./home-manager ];
  };

  programs.fish.enable = true;

  security.polkit.adminIdentities = [ "unix-user:${username.desktop}" ];
  security.polkit.extraConfig = ''
    // desktop user auto authed.
    polkit.addRule(function(action, subject) {
      if (subject.local && subject.user === "${username.desktop}") return "yes";
    });
  '';
}
