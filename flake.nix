{
  description = "NixOS configuration";
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };


  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };

    neovim-nightly-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs = { self, nixpkgs, nixos, home-manager, ... } @inputs:

    let
      overlays = [
        inputs.neovim-nightly-overlay.overlay
        (import ./overlays/weechat.nix)
      ];
      config = { allowUnfree = true; };

      nixosPackages = import nixos {
        system = "x86_64-linux";
        inherit config overlays;
      };
    in
    {
      homeConfigurations = {
        "lin@main" = home-manager.lib.homeManagerConfiguration {
          modules = [ ];
        };
      };
      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/main
            ./modules/hyprland.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs;
              home-manager.users.lin = import ./home;
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
        };
      };
    };
}


