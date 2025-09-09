{ config, pkgs, ... }: 

let
  home = config.home.homeDirectory;
in {
    
  #= XDG
  xdg = {
    enable = true;
    # autostart.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      #= Directories
      download = "${home}/Pobrane";
      desktop = "${home}/Pulpit";
      documents = "${home}/Dokumenty";
      music = "${home}/Muzyka";
      pictures = "${home}/Obrazy";
      videos = "${home}/Wideo";
      templates = "${home}/Szablony";
      publicShare = "${home}/Publiczne";
      #extraConfig = {
      #  XDG_BACKUP_DIR = "${home}/Backup";
      #  XDG_SCREENSHOTS_DIR = "${home}/Obrazy/Zrzuty ekranu";
      #};
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "gtk";
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
    mimeApps = {
      enable = true;
      defaultApplications = {

        # File Manager
        "inode/directory" = "nautilus.desktop";

        # Przeglądarka / Links
        "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
        "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
        
        # PDF
        "application/pdf" = "evince.desktop";

        # Obrazy
        "image/png" = "loupe.desktop";
        "image/jpg" = "loupe.desktop";
        "image/jpeg" = "loupe.desktop";
        "image/gif" = "loupe.desktop";
        "image/svg" = "loupe.desktop";
        "image/tiff" = "loupe.desktop";
        
        # Video
        "video/avi" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/mkv" = "mpv.desktop";
      };
    };
  };
}