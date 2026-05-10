{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        pkgs,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            hardware.graphics.extraPackages = with pkgs; [
                intel-media-driver
            ];

            environment.sessionVariables = {
                LIBVA_DRIVER_NAME = "iHD";
            };
        };
    };
}
