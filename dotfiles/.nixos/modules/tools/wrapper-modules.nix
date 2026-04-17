{ inputs, ... }: {
    imports = [
        inputs.wrapper-modules.flakeModules.wrappers
    ];

    options.flake.modules = inputs.flake-parts.lib.mkSubmoduleOptions {
        wrappers = inputs.nixpkgs.lib.mkOption {
            default = {};
        };
    };

    config.flake-file.inputs.wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
}
