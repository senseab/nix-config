{
  description = "All in one nix config";

  nixConfig = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store" # 中科大
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" # 清华
      "https://mirrors.bfsu.edu.cn/nix-channels/store" # 北外
      "https://mirror.sjtu.edu.cn/nix-channels/store" # 交大
      "https://nixos-cn.cachix.org"
      "https://cache.nixos.org/"
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-darwin.url = "nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, impermanence, home-manager, darwin, ... }: 
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

    genSystem = config: nixpkgs.lib.nixosSystem {
      system = if config?system then config.system else system;

      specialArgs = {
        inherit pkgs;
        inherit pkgs-unstable;
      };

      modules = [
        impermanence.nixosModules.impermanence 
      ] ++ config.modules ++ (if config?home-manager then [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users = config.home-manager;
        }
      ] else []);
    };
  in {

    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
        nixos-rebuild
        gnumake
      ];
    };

    nixosConfigurations.default = genSystem {
      modules = [
        ./devices/default
      ];
    };

    darwinConfigurations."mbp" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
        modules = [ 
        ./devices/mbp
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tonychyi = import ./home/users/tonychyi-mbp;
        }
      ];
    };
  };
}
