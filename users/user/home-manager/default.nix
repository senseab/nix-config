{ pkgs, ... }:
let
  useHyprland = true;
in
{
  _module.args.defaultTerminal = if useHyprland then "${pkgs.foot}/bin/foot" else "";

  imports = [
    ../../../home
    ../../../home/fonts.nix
    ../../../home/input_method.nix
    ../../../home/programs/timidity
    ../../../home/programs/fish.nix
    ../../../home/programs/flatpak.nix
    ../../../home/services/network-manager.nix
    ../../../home/desktop/hyprland
    ./home.nix
    ./programs.nix
  ];
}
