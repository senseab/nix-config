{
  imports = [
    ../../system/nix.nix
    ./homebrew.nix
  ];

  nix.settings.trusted-users =  [
    "tonychyi"
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  users.users.tonychyi = {
    name = "tonychyi";
    home = "/Users/tonychyi";
  };
}
