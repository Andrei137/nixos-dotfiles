{ config, pkgs, ... }:
{
    programs.firefox.enable = true;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
    ];
}
