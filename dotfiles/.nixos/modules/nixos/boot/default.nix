{
    flake.modules.nixos.base = {lib, ...}: {
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
}
