{ persistencePath, username, ... }:
{
  environment.persistence."${persistencePath}".users."${username.desktop}" = {
    directories = [
      # Personal Files
      "Applications"
      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Projects"
      "Public"
      "Templates"
      "Videos"

      # Configs
      ".cache"
      ".config"
      ".local"

      # For flatpak
      ".var"

      # For wine
      ".wine"

      # Special Directories
      {
        directory = ".gnupg";
        mode = "0700";
      }
      {
        directory = ".ssh";
        mode = "0700";
      }
    ];
    files = [ ];
  };
}
