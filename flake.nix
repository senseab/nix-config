rec {
  description = "All in one nix config";

  nixConfig = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store" # 中科大
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" # 清华
      #"https://mirrors.bfsu.edu.cn/nix-channels/store" # 北外
      "https://mirror.sjtu.edu.cn/nix-channels/store" # 交大
      #"https://nixos-cn.cachix.org"
      "https://cache.nixos.org/"
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-darwin.url = "nixpkgs/nixpkgs-24.05-darwin";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    hardware.url = "nixos-hardware/master";

    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-wayland,
      hardware,
      home-manager,
      vscode-server,
      impermanence,
      darwin,
      wsl,
      disko,
      nixos-anywhere,
      ...
    }:
    let
      system = "x86_64-linux";
      allowUnfree = true;

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = allowUnfree;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = allowUnfree;
      };

      pkgs-wayland = import nixpkgs-wayland {
        inherit system;
        config.allowUnfree = allowUnfree;
      };

      substituters = nixConfig.substituters;
      secret = import ./secret.nix;

      inherit (import ./consts.nix) persistencePath username rootMountOptions;
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          nixos-rebuild
          gnumake
        ];
      };

      packages."${system}" = (import ./packages.nix) { inherit system nixos-anywhere disko; };

      nixosConfigurations = (import ./modules/nixos.nix) {
        inherit
          nixpkgs
          nixpkgs-wayland
          impermanence
          hardware
          home-manager
          pkgs
          pkgs-unstable
          pkgs-wayland
          system
          wsl
          disko
          vscode-server
          username
          persistencePath
          rootMountOptions
          substituters
          secret
          ;
      };

      darwinConfigurations = (import ./modules/darwin.nix) { inherit darwin home-manager substituters; };

      homeConfigurations = (import ./modules/home-manager.nix) {
        inherit
          nixpkgs
          home-manager
          vscode-server
          system
          substituters
          ;
      };
    };
}
