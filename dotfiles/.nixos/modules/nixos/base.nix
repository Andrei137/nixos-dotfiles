{self, ...}: {
    flake.modules.nixos.base = {
        imports = with self.modules.nixos; [
            services
            plasma
            sddm
            fonts
            locales
            nix
            shell
        ];
    };
}
