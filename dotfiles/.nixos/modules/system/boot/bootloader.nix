{
    flake.modules.nixos.bootloader = {
        boot.loader = {
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
}
