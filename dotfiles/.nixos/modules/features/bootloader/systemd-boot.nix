{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        ...
    }: {
        imports = with self.modules.nixos; [
            lanzaboote
        ];

        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            boot.loader = {
                systemd-boot = {
                    enable = true;
                    consoleMode = "max";
                    configurationLimit = config.${module}.maxGenerations;
                };
                grub.enable = lib.mkForce false;
            };
        };
    };
}
