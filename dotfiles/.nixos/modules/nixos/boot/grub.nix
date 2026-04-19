{
    flake.modules.nixos.grub = {
        boot.loader = {
            grub = {
                enable = true;
                configurationLimit = 3;
                device = "nodev";
                useOSProber = true;
                efiSupport = true;
            };
            systemd-boot.enable = false;
        };
    };
}
