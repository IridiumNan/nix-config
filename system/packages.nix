{ pkgs, inputs, ... }:
{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # need for system
    keyd
    curl
    wget
    vim
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
    python3

    # Essential standard fonts
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono

    freerdp

    # For IOS mount
    libimobiledevice
    ifuse

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.core

    # dotfile manager
    chezmoi
  ];
}
