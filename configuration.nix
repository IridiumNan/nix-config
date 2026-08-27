# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hyprland.nix
      inputs.home-manager.nixosModules.default
    ];

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



  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
  ];

  i18n = {
   inputMethod = {
     enable = true;
     type = "fcitx5";
     fcitx5.addons = [
       pkgs.fcitx5-gtk
       pkgs.fcitx5-rime
       pkgs.qt6Packages.fcitx5-chinese-addons
       pkgs.rime-data
     ];
   };
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


# bluetooth
    hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    };
    services.blueman.enable = true;

# tlp charge thresh
    services.tlp = {
    enable = true;
    settings = {
            START_CHARGE_THRESH_BAT0 = 80;
            STOP_CHARGE_THRESH_BAT0 = 85;
        };
    };
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cai = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
    home = "/home/cai";
  };


  programs.firefox.enable = true;
  programs.zsh.enable = true;

# virt-manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "cai" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # tailscale
  services.tailscale.enable = true;

  # theme and icon
  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
          gtk-theme = "Adwaita";
          icon-theme = "Flat-Remix-Red-Dark";
          font-name = "Noto Sans Medium 11";
          document-font-name = "Noto Sans Medium 11";
          monospace-font-name = "Noto Sans Mono Medium 11";
      };
    }
  ];

  # keyd
  services.keyd.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # need for system
    keyd
    curl
    wget
    vim
    neovim
    git
    nodejs
    pavucontrol
    socat

    unzip
    zip
    xz
    tailscale
    tlp
    lm_sensors
    
    gcc
    go
    python3

    # Essential standard fonts
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 53317 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking = {
        hostName = "nixos-thinkpad";
        networkmanager.enable = true;
        proxy = {
                default = "http://127.0.0.1:7890/";
                noProxy = "127.0.0.1,localhost,internal.domain";
            };
        firewall = {
                enable = true;
                interfaces = {
                        # for default virt-manager network dns port
                        virbr0 = {
                                allowedUDPPorts = [ 53 67 ];
                            };
                    };
                    # 53317 for localsend_app
                    # 7890 for local clash proxy lan enable
                allowedTCPPorts = [ 7890 7891 53317 ];
                allowedUDPPorts = [ 7890 7891 ];
            };
        nat = {
                enable = true;
                internalInterfaces = [ "virbr0" ];
            };
    };

  home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users = {
                "cai" = import ./home.nix;
            };
    };

  # allow non free frimware
  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

  # config the mirrors tuna.tsinghua.edu.cn
  

  nix.settings = {
  # Prioritize fast mirrors over default cache
  substituters = lib.mkBefore [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];
  # Necessary for some systems to allow custom substituters
  trusted-users = [ "root" "@wheel" ];
};


}
