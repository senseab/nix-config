{lib}: with lib; {
  cfg = (import ./common.nix).cfg;

  imports = [];

  options = import ./options.nix;

  config = mkIf cfg.enable import ./config.nix;
}