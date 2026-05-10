{self, ...}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake.modules.nixos.${module} = {
        lib,
        pkgs,
        config,
        ...
    }: {
        options.${module}.${feature}.enable = lib.mkEnableOption "enable ${feature}";

        config = lib.mkIf config.${module}.${feature}.enable {
            services.desktopManager.gnome = {
                enable = true;
                extraGSettingsOverrides = ''
                    [org.gnome.mutter]
                    experimental-features=['scale-monitor-framebuffer']
                '';
            };

            environment.gnome.excludePackages = with pkgs; [
                atomix # puzzle game
                cheese # webcam tool
                epiphany # web browser
                evince # document viewer
                geary # email reader
                gedit # text editor
                gnome-characters
                gnome-music
                gnome-photos
                gnome-terminal
                gnome-tour
                hitori # sudoku game
                iagno # go game
                tali # poker game
                totem # video player
            ];
            programs = {
                dconf.enable = true;
                ssh.askPassword = pkgs.lib.mkForce "${pkgs.seahorse.out}/libexec/seahorse/ssh-askpass";
            };
            environment.systemPackages = with pkgs; [
                gnome-tweaks
                gnomeExtensions.appindicator
            ];
            services.udev.packages = with pkgs; [gnome-settings-daemon];
        };
    };
}
