{ config, pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.steam.enable = true;

  services.mullvad-vpn.enable = true;
  environment.systemPackages = with pkgs; [
    steam
    discord
    spotify
    kdePackages.kate
    git
    mullvad-vpn
  ];
}
