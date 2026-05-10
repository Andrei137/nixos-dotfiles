{self, ...}: let
    module = builtins.baseNameOf ./.;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        ...
    }: {
        options.${module}.enable = self.lib.mkModuleOption module;

        config = lib.mkIf config.${module}.enable {
            hardware.graphics = {
                enable = true;
                enable32Bit = true;
            };

            ${module} = {
                nvidia.enable = lib.mkDefault true;
            };
        };
    };
}
