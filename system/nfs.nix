{
  # WARN: comment this if the virtual machine is down unless nixos file system will always wait for connection
  fileSystems."/home/cai/fedora/WORK" = {
    device = "192.168.122.211:/home/cai/WORK";
    fsType = "nfs";
    # use lazy mount which make sure that when server mount point not available now, NixOS will work independently
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=10" ];
  };
}
