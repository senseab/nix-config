{ pkgs, ... }:
{
  system.stateVersion = "23.11";
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.interop.register = true;
  wsl.useWindowsDriver = true;
  wsl.startMenuLaunchers = true;

  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [ wget ];
  environment.sessionVariables = {
    LD_LIBRARY_PATH = [
      "/usr/lib/wsl/lib"
      "/run/opengl-driver/lib"
    ];
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "Nvidia";
  };

  services.vscode-server.enable = true;
  programs.fhs-env.enable = true;
  programs.fhs-env.profile = ''
    export PROMPT_COMMAND="echo -n '(FHS)'"
  '';

  imports = [
    ../../system/settings/nix.nix
    ../../system/settings/time.nix
    ../../system/settings/i18n.nix
    ../../system/settings/services.nix
    ../../system/settings/programs.nix
    ../../system/settings/appimage.nix
    ../../system/settings/flatpak.nix
    ../../system/settings/git.nix
    ../../system/settings/fonts.nix
    ../../system/settings/wayland.nix

    ../../users/nixos-wsl

    ../../lib/programs
  ];
}
