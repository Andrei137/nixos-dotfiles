{self, ...}: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {
        imports = with self.modules.nixos; [
            bluetooth
            boot
            coreutils
            fonts
            lanzaboote
            locales
            networking
            nix
            nvidia
            plasma
            sddm
            sound
            touchpad
            andrei
        ];

        system.stateVersion = "25.11";
    };
}
