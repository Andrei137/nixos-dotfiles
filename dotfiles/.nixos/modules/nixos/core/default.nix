{self, ...}: {
    flake.modules.nixos.base = {
        imports = with self.modules.nixos; [
            bluetooth
            coreutils
            fonts
            locales
            networking
            sound
            touchpad
        ];
    };
}
