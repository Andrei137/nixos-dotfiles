{self, ...}: {
    flake.modules.nixos.options = {lib, ...}: let
        categories = ["gpu" "boot"];

        generatedOptions = lib.genAttrs categories (name:
            lib.mkOption {
                type = lib.types.listOf (lib.types.enum (self.lib.readDirs ./${name}));
                default = [];
                description = "${name} options";
            });
    in {
        options.systemProperties =
            generatedOptions
            // {
                "secure-boot" = lib.mkOption {
                    type = lib.types.bool;
                    default = false;
                    description = "secure boot";
                };
            };
    };
}
