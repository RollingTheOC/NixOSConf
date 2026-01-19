{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NOTE: Secure Boot is intentionally left OFF on Surface devices.
  # Surface firmware only trusts Microsoft-signed binaries.
  # Attempting Secure Boot causes the system to fail to boot.
  # The annoying "Secure Boot off" banner is harmless, so we ignore it.
  # Trust me, I've tried to fix it. I'm not shimming keys just to have SB.
}
