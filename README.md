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

## NOTE

- **Check system/nfs.nix when before you build system** (unless you will blocked for nfs waiting)
- disable virt-machine when you don't need it
- **Bootloader contains the arch OS, If you don't need it. Just adjust**
