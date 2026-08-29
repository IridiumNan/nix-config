{

  programs.git = {

        enable = true;
        settings = {
            init.defaultBranch = "main";
            user = {
                    name = "IridiumNan";
                    email = "2930416610@qq.com";
                };
            };
    };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
