{ pkgs, ... }:

{
  programs.hyprland.enable = true;


  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpaper
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
