{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        pkgs,
        lib,
        config,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            environment.systemPackages = with pkgs; [
                sbctl
            ];

            boot.loader.systemd-boot.enable = lib.mkForce false;
            boot.lanzaboote.enable = lib.mkForce false;
            boot.loader.limine = {
                enable = true;
                inherit (config.${module}) maxGenerations;
                extraEntries = ''
                    /Windows
                        protocol: efi
                        path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
                '';
                style.wallpapers = [
                    "${self.packages.${pkgs.stdenv.hostPlatform.system}.wallpaper}/wallpaper.jpg"
                ];
                secureBoot = {
                    enable = config.${module}.secureBoot;
                    autoEnrollKeys.enable = true;
                    autoGenerateKeys = true;
                };
                extraConfig = ''
                    default_entry: Windows
                    timeout: 10
                '';
            };
        };
    };
}
