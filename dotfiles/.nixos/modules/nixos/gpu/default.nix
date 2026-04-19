{
    flake.modules.nixos.base = {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };
    };
}
