{ lib, config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. 
      /etc/nixos/hardware-configuration.nix  # Uncomment to use the default hardware configuration (recommended)

      ../modules/nixos/default.nix
    ];

  # Allow unfree packages (Needed for some drivers)
    nixpkgs.config.allowUnfree = true;

  # Graphics Card Related setting
    nvidia.enable = true;       # Enable if you have Nvidia Card
    
  # Gaming Settings
    gaming.enable = true;       # Sets everything for gaming
    mount.lexar.enable = true;  # Extra Drive for games
    minecraft.gaming.enable = true;    # set up java and install Prism Launcher


  # Garbage collector 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";  
  
} 
