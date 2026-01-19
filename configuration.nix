{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./boot.nix
    ./networking.nix
    ./desktop.nix
    ./audio.nix
    ./surface.nix
    ./users.nix
    ./packages.nix
  ];

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_ALL = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
