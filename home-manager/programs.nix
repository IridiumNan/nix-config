{
  programs.git = {

        enable = true;
        settings = {
            init.defaultBranch = "main";
            user = {
                    name = "IridiumNan";
                    email = "2930416610@qq.com";
                };
            # default action for pull is merge
            pull.rebase = false;
            };
    };
}
