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
            hardware.bluetooth = {
                enable = true;
                powerOnBoot = true;
                settings = {
                    General = {
                        Experimental = true;
                        FastConnectable = false;
                    };
                };
            };
            environment.systemPackages = with pkgs; [
                bluetui
            ];
        };
    };
}
