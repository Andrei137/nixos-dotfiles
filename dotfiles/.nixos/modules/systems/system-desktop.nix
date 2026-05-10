{self, ...}: let
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${feature} = {
        imports = with self.modules.nixos; [
            system-cli
            apps
            display-manager
            desktop-environment
            graphics
        ];

        apps = {
            firefox.enable = true;
        };
        core = {
            audio.enable = true;
            bluetooth.enable = true;
        };
    };
}
