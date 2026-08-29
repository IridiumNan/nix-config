# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./system/hardware-configuration.nix
      ./system/bootloader.nix
      ./system/services.nix
      ./system/keyboard.nix
      ./system/packages.nix
      ./system/user.nix
      ./system/virt-machine.nix
      ./system/network.nix
      ./system/nfs.nix

      ./common.nix
      ./hyprland.nix
      inputs.home-manager.nixosModules.default
    ];

}
