{
    flake.modules.nixos.kernel = {
        boot = {
            kernel.sysctl."kernel.sysrq" = 1;

            kernelParams = [
                "splash"
                "boot.shell_on_fail"
                "udev.log_priority"
                "rd.systemd.show_status=auto"
            ];

            tmp.cleanOnBoot = true;
        };
    };
}
