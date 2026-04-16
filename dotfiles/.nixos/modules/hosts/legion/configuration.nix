{ config, pkgs, ... }:
{
    imports = [
        ../../system/nvidia.nix
        ../../system/kde-plasma.nix
        ../../system/packages.nix
        ../../system/general.nix
        ../../system/sound.nix

        ../../users/andrei.nix

        ./hardware-configuration.nix
    ];
}
