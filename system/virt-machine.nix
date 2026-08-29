{
# virt-manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "cai" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
