{
  networking = {
        hostName = "nixos-thinkpad";
        networkmanager.enable = true;
        proxy = {
                default = "http://127.0.0.1:7890/";
                noProxy = "127.0.0.1,localhost,internal.domain,192.168.1.0/24,100.108.155.32/32";
            };
        firewall = {
                enable = true;
                interfaces =
		{
                        # for default virt-manager network dns port
                        virbr0 = {
                                allowedUDPPorts = [ 53 67 ];
                            };
			wlp0s20f3 = {
                		allowedTCPPorts = [ 5900 5901 7890 7891 53317 ];
                		allowedUDPPorts = [ 7890 7891 ];
			};
                    };
		    trustedInterfaces = [ "tailscale0" ];
                    # 5901 for wayvnc
                    # 53317 for localsend_app
                    # 7890 for local clash proxy lan enable
            };
        nat = {
                enable = true;
                internalInterfaces = [ "virbr0" ];
            };
    };

}
