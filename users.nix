{ config, pkgs, ... }:

{
  users.users.rolling = {
    isNormalUser = true;
    description = "rolling";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
