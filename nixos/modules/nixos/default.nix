{ config, lib, pkgs, ... }:

{

    imports = [
        ./bootloader/systemd.nix

        ./gaming/default.nix
        ./gaming/minecraft.nix

        ./hardware/ExtraDrives/lexar.nix
        ./hardware/GPU/nvidia.nix

        ./packages/flatpaks.nix

        ./shell/fish.nix

        ./system/audio.nix
        ./system/fonts.nix
        ./system/kernel.nix
        ./system/locale.nix
        ./system/network.nix
        ./system/services.nix
        ./system/timezone.nix
        ./system/users.nix

        ./desktop/hyprland.nix



    ];

            programs.firefox = {
            enable = true;
        };

}