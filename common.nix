{ lib, inputs, ... }:
{
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # allow non free frimware
  nixpkgs.config.allowUnfree = true;

  home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users = {
                "cai" = import ./home.nix;
            };
    };
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
