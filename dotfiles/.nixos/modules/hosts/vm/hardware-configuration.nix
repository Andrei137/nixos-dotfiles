let
    host = builtins.baseNameOf ./.;
in {
    flake.modules.nixos.${host} = { lib, ... }: {
        boot.initrd.availableKernelModules = ["sd_mod" "sr_mod"];
        boot.initrd.kernelModules = [];
        boot.kernelModules = [];
        boot.extraModulePackages = [];

        fileSystems."/" = {
            device = "/dev/disk/by-uuid/7b9b2ead-f769-40e9-90b1-0c8025a0d937";
            fsType = "ext4";
        };

        fileSystems."/boot" = {
            device = "/dev/disk/by-uuid/4830-14EC";
            fsType = "vfat";
            options = ["fmask=0077" "dmask=0077"];
        };

        swapDevices = [
            {device = "/dev/disk/by-uuid/8e3fd983-b7d1-440d-a096-0c2fcdd9ced6";}
        ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        virtualisation.hypervGuest.enable = true;
    };
}
