{self, ...}: {
    flake.modules.nixos.plasma = {pkgs, ...}: {
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
}
