{ config, lib, pkgs, ... }:

let
  cfg = config.mount.lexar;
in {
  options.mount.lexar.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable mounting Lexar USB drive at boot";
  };

  config = lib.mkIf cfg.enable {
    system.activationScripts.createMountPoint.text = ''
      mkdir -p /mnt/Lexar
      chown -R dacek:users /mnt
      chown -R dacek:users /mnt/Lexar
    '';

    fileSystems."/mnt/Lexar" = {
      device = "/dev/disk/by-uuid/70070a0b-78fb-4bc8-a314-1db30826c9ff";
      fsType = "ext4";
      options = [ "nofail" "nosuid" "nodev" "exec" ];
    };
  };
}
