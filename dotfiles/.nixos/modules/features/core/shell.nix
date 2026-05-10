{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        pkgs,
        config,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
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

            environment.systemPackages = with pkgs; [
                vim
                wget
                git
            ];
        };
    };
}
