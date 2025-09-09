{ lib, config, pkgs, ... }:

{
#Enable CUPS to print documents.
  services.printing.enable = true;

# Włącz sterowniki HP (HPLIP)
  services.printing.drivers = [ pkgs.hplip ];
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];

# Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

# Enable udisks2 and gvfs for managing disks and file systems.
  services.udisks2.enable = true;
  services.gvfs.enable = true;

# Enable the OpenSSH daemon.
  #services.openssh.enable = true;
}