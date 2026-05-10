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
            services.displayManager.sddm = {
                enable = true;
                theme = "breeze";
                wayland.enable = true;
            };

            environment.systemPackages = [
                pkgs.bruno
                (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
                    [General]
                    background = "${self.packages.${pkgs.stdenv.hostPlatform.system}.wallpaper}/wallpaper.jpg"
                    type=image
                '')
            ];
        };
    };
}
