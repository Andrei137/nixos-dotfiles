{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            services.xserver.displayManager.lightdm = {
                enable = true;
                greeters.gtk.enable = true;
                background = "#ffa07a";
            };
        };
    };
}
