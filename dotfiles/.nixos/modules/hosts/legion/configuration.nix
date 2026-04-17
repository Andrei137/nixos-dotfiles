{ self, inputs, lib, ... }: {
    flake.nixosConfigurations.legion = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.legion
            { nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; }
        ];
    };

    flake.nixosModules.legion = {
        imports = with self.nixosModules; [
            lanzaboote
            plasma
            nvidia
            apps
            settings
            sound
            andrei
        ];
    };
}
