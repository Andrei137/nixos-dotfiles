{self, ...}: let
    module = builtins.baseNameOf ./.;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        ...
    }: {
        options.${module} = {
            enable = self.lib.mkModuleOption module;
            secureBoot = lib.mkOption {
                type = lib.types.bool;
                default = true;
            };
            maxGenerations = lib.mkOption {
                type = lib.types.int;
                default = 5;
            };
        };

        config = lib.mkIf config.${module}.enable {
            boot = {
                loader = {
                    efi = {
                        canTouchEfiVariables = true;
                        efiSysMountPoint = "/boot";
                    };
                    timeout = lib.mkDefault 10;
                };

                tmp.cleanOnBoot = true;

                kernel.sysctl."kernel.sysrq" = 1;
                kernelParams = [
                    "splash"
                    "boot.shell_on_fail"
                    "udev.log_priority"
                    "rd.systemd.show_status=auto"
                ];
            };
        };
    };
}
