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
            services = {
                desktopManager.plasma6.enable = true;
                xserver = {
                    enable = true;
                    xkb = {
                        layout = "us";
                        variant = "";
                    };
                };
            };

            systemd.user.services.set-wallpaper = {
                description = "Set KDE Plasma wallpaper";
                wantedBy = ["plasma-workspace.target"];
                after = ["plasma-workspace.target"];
                serviceConfig = {
                    Type = "oneshot";
                    ExecStart = ''
                        ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-wallpaperimage \
                        ${self.packages.${pkgs.stdenv.hostPlatform.system}.wallpaper}/wallpaper.jpg
                    '';
                };
            };
        };
    };
}
