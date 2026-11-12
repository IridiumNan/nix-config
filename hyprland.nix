{ pkgs, ... }:

{
  programs.hyprland.enable = true;


  services.hypridle.enable = true;

    xdg.portal = {
    enable = true;
    extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" "gtk" ];
    };

  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpaper
    hypridle
    hyprlock
    hyprsunset

    # file browser
    nautilus

    # terminal
    kitty

    # utils for screenshot
    grim
    slurp
    satty

    # clipboard
    wl-clipboard

    # brightness control utils

    brightnessctl
  ];
}
