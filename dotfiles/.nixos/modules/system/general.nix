{self, ...}: {
    flake.modules.nixos.general = {
        imports = with self.modules.nixos; [
            boot
            services

            fonts
            graphics
            locales
            nix
            shell
        ];
    };
}

