_: {
    flake.modules.nixos.systemd-boot = {
        boot.loader.systemd-boot = {
            enable = true;
            consoleMode = "max";
            configurationLimit = 3;
        };
    };
}
