{self, ...}: {
    flake.modules.nixos.systemd-boot = {config, ...}: {
        imports = with self.modules.nixos; [
            lanzaboote
        ];

        boot.loader.systemd-boot = {
            enable = true;
            consoleMode = "max";
            configurationLimit = config.settings.maxGenerations;
        };
    };
}
