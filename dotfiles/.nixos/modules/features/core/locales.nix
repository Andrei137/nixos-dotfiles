{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        config,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";
        options.locale = {
            default = lib.mkOption {
                type = lib.types.str;
                default = "en_US.UTF-8";
            };
            timezone = lib.mkOption {
                type = lib.types.str;
                default = "Europe/Bucharest";
            };
        };

        config = lib.mkIf config.${module}.${feature}.enable {
            time.timeZone = config.locale.timezone;
            i18n.defaultLocale = config.locale.default;
        };
    };
}
