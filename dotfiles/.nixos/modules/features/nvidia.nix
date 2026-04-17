{
    flake.modules.nixos.nvidia = {
        hardware.nvidia = {
            open = false;
            nvidiaSettings = true;
            modesetting.enable = true;
        };

        hardware.graphics = {
            enable = true;
        };

        boot.kernelModules = ["nvidia-uvm"];

        hardware.nvidia-container-toolkit.enable = true;

        services.xserver.videoDrivers = ["nvidia"];
    };
}
