# directly used for homemanager, no nixos
let
  username = "coder";
in
{
  imports = [ ./home-manager ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
