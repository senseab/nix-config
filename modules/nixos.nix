{
  nixpkgs,
  impermanence,
  #hardware,
  home-manager,
  pkgs,
  pkgs-unstable,
  pkgs-wayland,
  system,
  wsl,
  disko,
  vscode-server,
  persistencePath,
  username,
  rootMountOptions,
  substituters,
  secret,
  ...
}:
let
  genSystem =
    config:
    nixpkgs.lib.nixosSystem {
      system = if config ? system then config.system else system;

      specialArgs = {
        inherit
          pkgs
          pkgs-unstable
          pkgs-wayland
          persistencePath
          username
          rootMountOptions
          substituters
          secret
          ;
        hostPlatform = system;
      };

      modules = [
        impermanence.nixosModules.impermanence
      ] ++ (if config ? modules then config.modules else [ ]);
    };
in
{
  default = genSystem {
    modules = [
      ../devices/default
      home-manager.nixosModules.home-manager
    ];
  };

  vps = genSystem { modules = [ ../devices/vps ]; };

  nuc = genSystem { modules = [ ../devices/nuc ]; };

  wsl = genSystem {
    modules = [
      wsl.nixosModules.wsl
      vscode-server.nixosModules.default
      home-manager.nixosModules.home-manager
      ../devices/wsl
    ];
  };

  vmware = genSystem {
    modules = [
      home-manager.nixosModules.home-manager
      disko.nixosModules.disko
      ../devices/vmware
    ];
  };
}
