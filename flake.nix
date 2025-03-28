{
  description = "home.nix and configuration.nix system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
 
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    
    
    
  };

  outputs = { self, nixpkgs, home-manager, astal, ags, ... }@inputs:
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
 
      packages.${system}. default = pkgs.stdenvNoCC.mkDerivation rec {
        name = "my-shell";
        src = ./.;
         nativeBuildInputs = [
           ags.packages.${system}.default
           pkgs.wrapGAppsHook
           pkgs.gobject-introspection
         ];

        buildInputs = with astal.packages.${system}; [
          astal4
          io
          battery 
          # any other package
        ];
        installPhase = ''
          mkdir -p $out/bin
          ags bundle app.ts $out/bin/${name}
        '';

   
    

};       
   }; 




}
