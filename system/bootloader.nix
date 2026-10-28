{ pkgs ,... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  # boot.loader.efi.canTouchEfiVariables = true;

# Use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = false;
    };
  };
}
