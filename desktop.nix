{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb.layout = "us";

  # Intel graphics (Wayland + Steam)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
