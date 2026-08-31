{ pkgs, ...}:
{
  # tlp charge thresh
  services.tlp = {
  enable = true;
  settings = {
          START_CHARGE_THRESH_BAT0 = 80;
          STOP_CHARGE_THRESH_BAT0 = 85;
      };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;


  # tailscale
  services.tailscale.enable = true;


  # keyd
  services.keyd.enable = true;


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # IOS auto mount
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
}
