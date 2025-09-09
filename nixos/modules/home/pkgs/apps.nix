{ config, pkgs, lib, ... }:

{

    home.packages = with pkgs; [
        # User
        discord             # Communicator
        spotify             # Music Streaming Service
        obs-studio          # Video Recording/Live Streaming App
        qbittorrent         # Torrent

        # Office
        libreoffice-fresh   # Office Bundle
        evince              # PDF reader
        hplip               # HP device manager

        # System
        nautilus            # File Manager
        mpv                 # Video Player
        loupe               # Image Browser

    
    ];
}