{
    flake.modules.nixos.amd = {
        services.xserver.videoDrivers = ["amdgpu"];

        boot = {
            initrd.kernelModules = [
                "amdgpu"
            ];
        };
    };
}
