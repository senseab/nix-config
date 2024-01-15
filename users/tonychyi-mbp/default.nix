let
  username = "tonychyi";
in
{
  imports = [ ../../system/settings/home-manager.nix ];

  users.users."${username}" = {
    name = username;
    home = "/Users/${username}";
  };

  home-manager.users."${username}" = {
    imports = [ ./home-manager ];
  };
}
