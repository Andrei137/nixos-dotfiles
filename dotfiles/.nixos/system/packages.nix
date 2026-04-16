{ config, pkgs, inputs ... }:
{
    programs.firefox.enable = true;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix
    ];
}
