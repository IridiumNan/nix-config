{
  description = "A NIXOS configuration";

  inputs = {
    #nixvim.url = "github:IridiumNan/nixvim";

    nixvim.url = "git+file:///home/cai/nix-repo/nixvim/";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.nixos-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
      ];
    };
  };
}
