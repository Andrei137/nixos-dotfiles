{self, ...}: {
    flake.modules.nixos.boot = {
        imports = with self.modules.nixos; [
            bootloader
            kernel
            lanzaboote
            sddm
        ];
    };
}
