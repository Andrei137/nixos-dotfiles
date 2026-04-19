{
    flake.modules.nixos.locales = {
        time = {
            timeZone = "Europe/Bucharest";
            hardwareClockInLocalTime = true;
        };
        i18n.defaultLocale = "en_US.UTF-8";
    };
}
