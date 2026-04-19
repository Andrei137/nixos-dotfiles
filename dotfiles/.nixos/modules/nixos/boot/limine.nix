_: {
    flake.modules.nixos.limine = {
        config,
        pkgs,
        lib,
        ...
    }: {
        environment.systemPackages = with pkgs; [
            sbctl
        ];

        boot.loader.systemd-boot.enable = lib.mkForce false;
        boot.loader.limine = {
            enable = true;
            inherit (config.settings) maxGenerations;
            extraEntries = ''
                /Windows
                    protocol: efi
                    path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
            '';
            secureBoot = {
                enable = config.settings.secureBoot;
                autoEnrollKeys.enable = true;
                autoGenerateKeys = true;
            };
        };
    };
}
