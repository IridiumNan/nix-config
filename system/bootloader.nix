{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = false;
      extraEntries = ''
    menuentry "Arch Linux" --class arch {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root 565C-4978
        linux  /vmlinuz-linux root=UUID=74240546-29a9-4fdb-8807-24cfcd4b406b rw quiet
        initrd /initramfs-linux.img
    }'';
    };
  };
}
