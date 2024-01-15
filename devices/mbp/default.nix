{
  imports = [
    ../../system/settings/nix.nix
    ../../users/tonychyi-mbp
    ./homebrew.nix
  ];

  nix.settings.trusted-users = [ "tonychyi" ];

  time.timeZone = "Asia/Shanghai";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # macos only.
  services.nix-daemon.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  nix.gc.interval = {
    Day = 7;
  };
}
