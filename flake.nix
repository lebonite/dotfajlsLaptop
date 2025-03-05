{
  description = "home.nix and configuration.nix system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   

    
    
    
    
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations."flutterNix" = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            home-manager.nixosModules.home-manager
            { 
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.Hedwig = import ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix 
            }
          ];
        };
    };



}
