{
    flake.modules.nixos.shell = {
        security.sudo = {
            enable = true;
            wheelNeedsPassword = true;

            extraConfig = ''
                Defaults passwd_timeout=0
                Defaults timestamp_timeout=15
            '';
        };

        programs.zsh = {
            enable = true;
        };
    };
}
