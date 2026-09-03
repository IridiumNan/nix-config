{ pkgs, lib, ... }:
{
    # Enable apple_curor which is non free
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "apple_cursor"
           ];
    home.pointerCursor = {
  	enable = true;
        gtk.enable = true;

        package = pkgs.apple-cursor;
        name = "macOS";
        size = 16;
    };

    gtk = {
        enable = true;
            iconTheme = {
                package = pkgs.adwaita-icon-theme;
                name = "Adwaita";
                };
    };
}
