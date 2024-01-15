let
  systemConfig = {
    targetDisk = "/dev/sda";
    swapSize = "8G";
  };
in
{
  _module.args.systemConfig = systemConfig;
}
