# NixSO Configuration

## Structure

```tree
.
├── common.nix              # system version timeZone etc...
├── configuration.nix       # import system module and common.nix
├── flake.lock
├── flake.nix
├── home-manager
│   ├── common.nix          # user name & home dir
│   ├── packages.nix        # packages for user
│   ├── programs.nix        # programs for user
│   └── variables.nix       # env variants for user
├── home.nix                # import all modules on home-manager/
├── hyprland.nix            # enable and configuration about hyprland
├── README.md
└── system
    ├── bootloader.nix
    ├── hardware-configuration.nix
    ├── keyboard.nix
    ├── network.nix         # network configuration  (proxy and network interface configuration)
    ├── nfs.nix             # mount by nfs (which for virtual machine)
    ├── packages.nix        # system wide packages
    ├── services.nix        # system wide services
    ├── user.nix            # user shell & group configuration
    └── virt-machine.nix
```

## Kernel Upgrade

- Uncomment the `system/bootloader` line 7:
```nix
    boot.kernelPackages = pkgs.linuxPackages_latest;
```

- rebuild system and switch after reboot

```bash
sudo nixos-rebuild boot --flake . --print-build-logs --upgrade
```

## FileSystem

- partition for `/` should be labeled as `NIXROOT`
- partition for `/boot` should be labeled as `NIXBOOT`
- partition for `/swap` should be labeled as `SWAP`

If you want to modify the configuration, see `system/hardware-configuration.nix`

## NOTE

- **Check system/nfs.nix when before you build system**
- disable virt-machine when you don't need it
- **Bootloader contains the arch OS, If you don't need it. Just adjust**
