{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in {
  options.minecraft.gaming = {
    enable = mkEnableOption "Enable Minecraft and PrismLauncher setup";
  };

  config = mkIf config.minecraft.gaming.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      jdk17
    ];

    programs.java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
