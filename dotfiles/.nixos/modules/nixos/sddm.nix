{self, ...}: {
    flake.modules.nixos.sddm = {pkgs, ...}: let
        theme = "breeze";
    in {
        services.displayManager.sddm = {
            enable = true;
            inherit theme;
            wayland.enable = true;
        };

        environment.systemPackages = with pkgs; [
            (pkgs.writeTextDir "share/sddm/themes/${theme}/theme.conf.user" ''
                [General]
                background = "${self.packages.${pkgs.stdenv.hostPlatform.system}.wallpaper}/wallpaper.jpg"
            '')
        ];
    };
}
