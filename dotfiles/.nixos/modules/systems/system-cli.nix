{self, ...}: let
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${feature} = {
        imports = with self.modules.nixos; [
            system-minimal
            bootloader
            core
        ];

        core = {
            fonts.enable = true;
            locales.enable = true;
            networking.enable = true;
            shell.enable = true;
        };
    };
}
