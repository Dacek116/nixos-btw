{ config, pkgs, lib, ... }:

{

    home.packages = with pkgs; [
      rofi      # App launcher
      hyprpanel # status bar
      swww      # Daemon for wallpapers
      waypaper  # GUI wallpaper setter
      hyprlock  # Locksreen for hyprland
      grimblast # Screenshot utility
      wlogout   # Power menu
      swaynotificationcenter
    ];
}