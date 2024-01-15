{ username, ... }:
{
  security.sudo.wheelNeedsPassword = true;

  users.users."${username.server}" = {
    isNormalUser = true;
    description = "Login user for server";
    hashedPassword = "$y$j9T$XMNDyrhWt/0Hml8Lp9e/91$PuqtfFbvUUjJgiEE9KNBRziWppEWbAD54j7ydmD0BY8";

    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG4D8YhuKaVoVu5f51SwO8FHmIMxytQ1VXzLr4qe1GnQ tonychyi@TonyChyideMacBook-Pro.local"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpWqnXVD/wC1IyWMNUtvPCnj7NtTfT1GaeKiDYILHIa coder@code-server-7dd77f88fb-5vlbj"
    ];
  };
}
