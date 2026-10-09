{
# virt-manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "cai" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

# distrobox
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  virtualisation.containers.registries.settings = {
  unqualified-search-registries = [
    "registry.fedoraproject.org"
    "docker.io"
    "quay.io"
  ];
};

}
