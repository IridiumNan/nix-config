{ pkgs, ... }:
{

    programs.zsh.enable = true;

    programs.kdeconnect.enable = true;
    programs.wireshark.enable = true;
    # programs.localsend = {
    #     enable = true;
    # };
# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.cai = {
        isNormalUser = true;
        extraGroups = [
            "wheel" # Enable ‘sudo’ for the user.
            "input" # For Input device monitor (read keyboard)
            "wireshark"
        ];
        packages = with pkgs; [
            tree
        ];
        shell = pkgs.zsh;
        home = "/home/cai";
    };
}
