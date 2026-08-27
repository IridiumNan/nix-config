{
  description = "Minimal NixOS Flake with Zen Browser";

  inputs = {
    # System core packages repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # nixvim
    nixvim.url = "github:nix-community/nixvim";

    # Zen Browser third-party flake input
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, zen-browser, ... }@inputs: {
    nixosConfigurations.nixos-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Change if you use a different system architecture
      
      # Passes inputs (including zen-browser) down to configuration.nix
      specialArgs = { inherit inputs; }; 
      
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };


}
