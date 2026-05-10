{
    perSystem = {pkgs, ...}: {
        packages.wallpaper = pkgs.stdenvNoCC.mkDerivation {
            name = "wallpaper";
            src = ./wallpaper.jpg;
            dontUnpack = true;
            installPhase = ''
                mkdir -p $out
                cp $src $out/wallpaper.jpg
            '';
        };
    };
}
