{
  # WARN: comment this if the virtual machine is down unless nixos file system will always wait for connection
  fileSystems."/home/cai/FWORK" = {
    device = "192.168.122.211:/home/cai/WORK";
    fsType = "nfs";
  };
}
