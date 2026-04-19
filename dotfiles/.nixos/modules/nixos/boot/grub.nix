{
    flake.modules.nixos.grub = {config, ...}: {
        boot.loader = {
            grub = {
                enable = true;
                configurationLimit = config.settings.maxGenerations;
                device = "nodev";
                useOSProber = true;
                efiSupport = true;
            };
            systemd-boot.enable = false;
        };
    };
}
