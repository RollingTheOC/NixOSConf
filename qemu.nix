{ config, pkgs, ... }:

{
  # Enable libvirt daemon
  virtualisation.libvirtd.enable = true;

  # Optional: install Virt‑Manager GUI and QEMU virtualization tools
  environment.systemPackages = with pkgs; [
    qemu                # qemu virtualization tools
    qemu_kvm            # KVM acceleration
    virt-manager        # GUI management tool
    libvirt             # CLI libvirt tools
    bridge-utils        # networking helpers
  ];

  # Add your user to required groups
  users.extraGroups = {
    libvirtd.members = [ "rolling" ];  # allows managing VMs
    kvm.members     = [ "rolling" ];   # allows KVM acceleration
  };
}
