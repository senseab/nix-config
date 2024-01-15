# Will remove after home-manager is ready for fonts management.
{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      source-han-sans
      source-han-serif
      source-han-mono
      source-code-pro
      font-awesome_5
      powerline-fonts
      powerline-symbols
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
        ];
      })
    ];

    fontconfig.cache32Bit = true;

    fontconfig.defaultFonts = {
      serif = [ "Source Han Serif SC" ];

      sansSerif = [ "Source Han Sans SC" ];

      monospace = [
        "Fira Code"
        "Source Han Mono SC"
      ];
    };
  };
}
