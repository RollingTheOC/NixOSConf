{ config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    virtualbox
  ];

  # Add user 'rolling' to vboxusers
  users.extraGroups = {
    vboxusers.members = [ "rolling" ];
  };

  # Optional firewall/RDP port for VMs
  networking.firewall.allowedTCPPorts = [ 5900 ];
}
