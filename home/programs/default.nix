{
  imports = [
    ./git.nix
    ./starship
  ];

  programs.home-manager.enable = true;
  programs.btop.enable = true;
  programs.bat.enable = true;
  programs.less.enable = true;
  programs.yazi.enable = true;
  programs.thefuck.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;
    icons = true;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}
