{
  home-manager,
  vscode-server,
  nixpkgs,
  system,
  ...
}:
{
  "coder" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};

    modules = [
      vscode-server.homeModules.default
      ../users/coder
    ];
  };
}
