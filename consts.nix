{
  # some consts.
  persistencePath = "/nix/persistent";
  username = {
    desktop = "user";
    server = "login";
  };

  rootMountOptions = [
    "relatime"
    "mode=755"
    "nosuid"
    "nodev"
  ];
}
