{ config, lib, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.hypridle.enable = true;

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


  ];
}
