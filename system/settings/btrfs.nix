{ persistencePath, ... }:
{
  # just for btrfs use, and btrfs will for all desktop device.
  fileSystems."${persistencePath}".neededForBoot = true;

  # a backup tool
  #environment.systemPackages = with pkgs; [
  #  timeshift
  #  psmisc
  #  cron
  #];
}
