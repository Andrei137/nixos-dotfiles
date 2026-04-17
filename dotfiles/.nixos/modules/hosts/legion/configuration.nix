{
    self,
    inputs,
    ...
}: {
    flake.nixosConfigurations.legion = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.modules.nixos; [
            legion
        ];
    };

    flake.modules.nixos.legion = {
        imports = with self.modules.nixos; [
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
