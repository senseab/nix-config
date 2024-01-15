{
  imports = [
    ./timidity.nix
  ];

  programs.home-manager.enable = true;
  programs.btop.enable = true;
  programs.bat.enable = true;
  programs.direnv.enable = true;
  programs.yazi.enable = true;
  programs.thefuck.enable = true;
  
  programs.eza = {
    enable = false;
    enableAliases = true;
    git = true;
    icons = true;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}