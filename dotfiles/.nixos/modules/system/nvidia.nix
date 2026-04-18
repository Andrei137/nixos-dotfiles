{
    flake.modules.nixos.nvidia = {config, ...}: {
        hardware = {
            nvidia = {
                open = false;
                nvidiaSettings = true;
                powerManagement.enable = true;
                modesetting.enable = true;
                package = config.boot.kernelPackages.nvidiaPackages.latest;
            };

            graphics = {
                enable = true;
                enable32Bit = true;
            };

            nvidia-container-toolkit.enable = true;
        };

        services.xserver.videoDrivers = ["nvidia"];
    };
}
