let
  username = "nixos";
in
{ pkgs, ... }:
{
  imports = [ ../../system/settings/home-manager.nix ];

  home-manager.users."${username}" = {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    imports = [ ./home-manager ];
  };

  users.users."${username}" = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
