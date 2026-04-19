{
    flake.modules.nixos.locales = {config, ...}: {
        time.timeZone = config.settings.timezone;
        i18n.defaultLocale = config.settings.locale;
    };
}
