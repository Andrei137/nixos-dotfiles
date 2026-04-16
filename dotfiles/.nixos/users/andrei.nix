{ config, pkgs, ... }:
{
  users.users.andrei = {
    isNormalUser = true;
    description = "Andrei";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      wezterm
      devbox
      discord
      telegram-desktop
      kdePackages.kate 
    ];
    shell = pkgs.zsh;
  };

}
