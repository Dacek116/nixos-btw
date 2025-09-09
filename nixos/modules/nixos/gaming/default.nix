{ config, pkgs, lib, ... }:

let
  enableGaming = config.gaming.enable;
in
{
  options.gaming.enable = lib.mkEnableOption "Enable the Steam gaming setup";

  config = lib.mkIf enableGaming {
    programs.steam.enable = true;
    programs.steam.remotePlay.openFirewall = true;
    programs.steam.dedicatedServer.openFirewall = true;
    programs.steam.extest.enable = false;
    programs.steam.protontricks.enable = true;

    hardware.steam-hardware.enable = true;

    programs.gamescope.enable = true;
    programs.gamescope.package = pkgs.gamescope;
    programs.gamescope.capSysNice = true;

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      protontricks
      protonplus
      heroic
      mangohud
      goverlay
      libva
      libva-utils
      vulkan-tools
      vulkan-headers
      mesa
    ];
  };
}
