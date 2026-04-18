{
    flake.modules.nixos.nvidia = {config, ...}: {
        hardware = {
            nvidia = {
                open = false;
                nvidiaSettings = true;
                powerManagement.enable = true;
                modesetting.enable = true;
                package = config.boot.kernelPackages.nvidiaPackages.latest;
                forceFullCompositionPipeline = true;
            };

            nvidia-container-toolkit.enable = true;
        };

        services.xserver.videoDrivers = ["nvidia"];

        boot = {
            kernelParams = [
                "nvidia-drm.modeset=1"
            ];
            initrd.kernelModules = [
                "nvidia"
                "nvidia_modeset"
                "nvidia_uvm"
                "nvidia_drm"
            ];
            extraModulePackages = [config.boot.kernelPackages.nvidia_x11];
        };
    };
}
