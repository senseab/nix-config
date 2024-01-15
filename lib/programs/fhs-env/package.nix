{ pkgs, cfg, ... }:
let
  base = pkgs.appimageTools.defaultFhsEnvArgs;
in
pkgs.buildFHSUserEnv (
  base
  // {
    name = cfg.command;
    targetPkgs = pkgs: ((base.targetPkgs pkgs) ++ cfg.packages);
    profile = "export FHS=1" + "\n" + cfg.profile;
    runScript = cfg.shell;
    extraOutputsToInstall = cfg.extraOutputs;
  }
)
