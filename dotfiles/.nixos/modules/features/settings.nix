{
    flake.modules.nixos.settings = {
        # Bootloader.
        boot.loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot = {
                enable = true;
                consoleMode = "max";
                configurationLimit = 5;
            };
        };

        # Enable networking
        networking.networkmanager.enable = true;

        # Set your time zone.
        time.timeZone = "Europe/Bucharest";

        # Select internationalisation properties.
        i18n.defaultLocale = "en_US.UTF-8";

        # Enable CUPS to print documents.
        services.printing.enable = true;

        # Enable touchpad
        services.libinput.enable = true;

        nix.settings.experimental-features = ["nix-command" "flakes"];

        nixpkgs.config.allowUnfree = true;

        system.stateVersion = "25.11";
    };
}
