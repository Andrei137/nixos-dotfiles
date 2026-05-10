{self, ...}: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {...}: {
        imports = with self.modules.nixos; [
            system-desktop
            andrei
        ];

        bootloader.limine.enable = true;
        core.touchpad.enable = true;
        display-manager.ly.enable = true;
        desktop-environment.plasma.enable = true;
        graphics.nvidia.enable = true;
    };
}
