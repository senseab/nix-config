{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.programs.fhs-env;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = [ (import ./package.nix { inherit pkgs cfg; }) ];
  };
}
