{
    flake.modules.nixos.boot = {
        boot = {
             kernelParams = [
                 "quiet"
                 "splash"
                 "boot.shell_on_fail"
                 "udev.log_priority"
                 "rd.systemd.show_status=auto"
                 "nvidia-drm.modeset=1"
            ];

            initrd.kernelModules = [
                "nvidia"
                "nvidia_modeset"
                "nvidia_uvm"
                "nvidia_drm"
            ];

            tmp.cleanOnBoot = true;

            loader = {
                efi = {
                    canTouchEfiVariables = true;
                    efiSysMountPoint = "/boot";
                };
                systemd-boot = {
                    enable = true;
                    consoleMode = "max";
                    configurationLimit = 3;
                };
            };
        };
    };
}

