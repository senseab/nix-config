{
  imports = [
    ../../../home
    ../../../home/programs/fish.nix
    ../../../home/programs/flatpak.nix
    ./home.nix
    ./programs.nix
  ];

  services.vscode-server.enable = true;
}
