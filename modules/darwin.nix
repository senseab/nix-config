{ darwin, home-manager, ... }:
{
  mbp = darwin.lib.darwinSystem {
    system = "x86_64-darwin";
    modules = [
      ../devices/mbp
      home-manager.darwinModules.home-manager
    ];
  };
}
