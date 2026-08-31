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
                        # 7890 and 7891 for proxy
                        virbr0 = {
                                allowedTCPPorts = [ 7890 7891 ];
                                allowedUDPPorts = [ 53 67 7890 7891 ];
                            };
			wlp0s20f3 = {
                                                # 5901 for wayvnc
                                                # 7890 7891 for clash
                                                # 53317 for localsend
                                                # 8080 opened for test
                		allowedTCPPorts = [ 5900 5901 7890 7891 8080 53317 ];
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
