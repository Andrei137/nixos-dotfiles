let
    host = builtins.baseNameOf ./.;
in {
    flake.modules.nixos.${host} = {
        /*
    replace with hardware-configuration.nix
    */
    };
}
