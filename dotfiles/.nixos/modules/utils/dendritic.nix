{
    inputs,
    lib,
    ...
}: {
    imports = [
        inputs.flake-file.flakeModules.dendritic
    ];

    options.flake.lib = lib.mkOption {
        default = {};
        type = lib.types.attrsOf lib.types.unspecified;
    };

    config.flake.lib = {
        mkNixos = name: {
            ${name} = inputs.nixpkgs.lib.nixosSystem {
                modules = [
                    inputs.self.modules.nixos.${name}
                    {
                        networking.hostName = lib.mkDefault name;
                    }
                ];
            };
        };
    };
}
