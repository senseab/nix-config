# common sets for all systems.
{
  imports = [
    ../settings/impermanence.nix
    ../settings/nix.nix
    ../settings/time.nix
    ../settings/i18n.nix
    ../settings/services.nix
    ../settings/programs.nix
    ../settings/user.nix
    ../settings/disable-docs.nix
    ../settings/git.nix
    ../settings/security.nix

    ../../lib
  ];

  # for nixos
  nix.gc.dates = "weekly";
}
