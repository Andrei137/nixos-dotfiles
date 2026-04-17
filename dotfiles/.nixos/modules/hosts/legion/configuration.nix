{ self, inputs, lib, ... }: {
    flake.nixosConfigurations.legion = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.legion
            { nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; }
        ];
    };

    flake.nixosModules.legion = {
        imports = [
            self.nixosModules.lanzaboote
            self.nixosModules.plasma
            self.nixosModules.nvidia
            self.nixosModules.apps
            self.nixosModules.settings
            self.nixosModules.sound
            self.nixosModules.andrei
        ];
    };
}
