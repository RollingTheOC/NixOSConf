{ config, pkgs, ... }:

{
  # No special kernel for now

  services.fwupd.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
