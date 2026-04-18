{self, ...}: {
    flake.modules.nixos.services = {
        imports = with self.modules.nixos; [
            bluetooth
            coreutils
            networking
            sound
            touchpad
        ];
    };
}
