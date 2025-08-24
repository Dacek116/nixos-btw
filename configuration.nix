# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


##############################################
##########        Spis Treści       ##########
##############################################

# 1.  System
# 2.  Środowisko Graficzne
# 3.  Aplikacje i Programy


##############################################
############        System        ############
##############################################


{ lib, config, pkgs, ... }:


{

  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use latest kernel. 
  boot.kernelPackages = pkgs.linuxPackages_6_15;

  networking.hostName = "nixos-btw"; # Nazwa urządzenia
  
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Włącz NetworkManager (Wymagane do działania internetu)
  networking.networkmanager.enable = true;

  # Ustaw Strefe Czasową
  time.timeZone = "Europe/Warsaw";

  # Wybierz właściwości internacjonalizacji.
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

    # Configure console keymap
  console.keyMap = "pl2";

##############################################
#######           Usługi             #########
##############################################

   # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

    # Enable CUPS to print documents.
  services.printing.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  #services.envfs.enable = true;
  #services.resolved.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

##############################################
#######    Środowisko Graficzne      #########
##############################################



  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.hyprland.enable = true;

##############################################
#######    Użytkownik i Programy      ########
##############################################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixdacek = {
    isNormalUser = true;
    description = "Dawid Czachor";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
    discord
    spotify
    heroic
    lutris
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   kitty
   vscode
   hyprpanel
   rofi
   nano
   fastfetch
    goverlay
    mangohud
    protonup-qt
    heroic
    lutris
  ];

  programs.git = {
    enable = true;
    config = {
      user.name = "Dacek116";
      user.email = "dapeloom046@gmail.com";
      init.defaultBranch = "main";
    };
  };
  
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamescope = {
  enable = true;
  capSysNice = true;
};
programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  programs.steam.package = pkgs.steam.override {
  extraPkgs = pkgs': with pkgs'; [
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXScrnSaver
    libpng
    libpulseaudio
    libvorbis
    stdenv.cc.cc.lib # Provides libstdc++.so.6
    libkrb5
    keyutils
    # Add other libraries as needed
  ];
};


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

########################################
#######    Garbage Collector    ########
########################################

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 15d";
  };

########################################
#######         Nvidia          ########
########################################

hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

# Enable proprietary NVIDIA driver with modesetting
hardware.nvidia = {
modesetting.enable = true; # Wymagane dla Wayland
nvidiaSettings = true;
open = false;  # Use proprietary driver, not nouveau
package = config.boot.kernelPackages.nvidiaPackages.latest;
};

# Enable X server with NVIDIA driver
services.xserver = {
enable = true;
videoDrivers = [ "nvidia" ];
};

# Environment variables for Wayland or X11 sessions
environment.sessionVariables = {
GBM_BACKEND = "nvidia-drm";
LIBVA_DRIVER_NAME = "nvidia";
__GLX_VENDOR_LIBRARY_NAME = "nvidia";
XDG_SESSION_TYPE = "wayland"; # Change to "x11" if you use X11
};

# Accept NVIDIA license
nixpkgs.config.nvidia.acceptLicense = true;

###############################
### GAMING ###################
#############################

environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "\${HOME}/.steam/root/compatibilitytools.d";

};


}

