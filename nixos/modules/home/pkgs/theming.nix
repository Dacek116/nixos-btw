{ lib, config, pkgs, ... }:

{

  home.packages = with pkgs; [ 
  # Theming Tools
    nwg-look
    matugen
    mpvpaper

  # Themes
    papirus-icon-theme
    papirus-folders
    adw-gtk3
    capitaine-cursors

  # Libs
    gtk3
    gtk4
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum 
    
  ];

  # QT5
  qt.enable = true;
  qt.style.name = "kvantum";
  
  
}