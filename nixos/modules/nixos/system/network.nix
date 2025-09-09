{ lib, config, pkgs, ... }:

{
    # Networking
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };
}