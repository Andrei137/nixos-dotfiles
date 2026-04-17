{ inputs, ... }: {
    imports = [
        inputs.wrapper-modules.flakeModules.wrappers
    ];

    options.flake = inputs.flake-parts.lib.mkSubmoduleOptions {
        wrappersModules = inputs.nixpkgs.lib.mkOption {
            default = {};
        };
    };

    config.flake-file.inputs.wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
}
