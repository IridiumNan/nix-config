{
  networking = {
        hostName = "nixos-virtual";
        networkmanager.enable = true;
        proxy = {
                # change the proxy configuration
                default = "http://127.0.0.1:7890/";
                noProxy = "127.0.0.1,localhost,internal.domain,192.168.1.0/24,100.108.155.32/32";
            };
        firewall = {
                enable = false;
            };
        # nat = {
        #         enable = true;
        #         internalInterfaces = [ "virbr0" ];
        #     };
    };

}
