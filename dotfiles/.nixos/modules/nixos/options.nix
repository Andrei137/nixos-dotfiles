_: {
    flake.modules.nixos.base = {lib, ...}: {
        options.settings = {
            secureBoot = lib.mkOption {
                type = lib.types.bool;
                default = true;
            };
            maxGenerations = lib.mkOption {
                type = lib.types.int;
                default = 3;
            };
            locale = lib.mkOption {
                type = lib.types.str;
                default = "en_US.UTF-8";
            };
            timezone = lib.mkOption {
                type = lib.types.str;
                default = "Europe/Bucharest";
            };
        };
    };
}
