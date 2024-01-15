{ lib, ... }:
with lib;
{
  options.programs.fhs-env = {
    enable = mkEnableOption "make a FHS environment";
    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };

    command = mkOption {
      type = types.str;
      default = "fhs";
    };

    shell = mkOption {
      type = types.str;
      default = "bash";
    };

    extraOutputs = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

    profile = mkOption {
      type = types.str;
      default = "";
    };
  };
}
