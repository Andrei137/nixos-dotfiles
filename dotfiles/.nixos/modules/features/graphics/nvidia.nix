{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        config,
        lib,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            hardware = {
                nvidia = {
                    open = true;
                    nvidiaSettings = true;
                    powerManagement.enable = true;
                    modesetting.enable = true;
                    package = config.boot.kernelPackages.nvidiaPackages.stable;
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
    };
}
