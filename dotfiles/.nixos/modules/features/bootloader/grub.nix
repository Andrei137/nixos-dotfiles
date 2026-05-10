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
            boot.loader = {
                grub = {
                    enable = true;
                    configurationLimit = config.${module}.maxGenerations;
                    device = "nodev";
                    useOSProber = true;
                    efiSupport = true;
                };
                systemd-boot.enable = lib.mkForce false;
            };
        };
    };
}
