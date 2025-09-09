{ lib, config, pkgs, ... }:

{

    home.packages = with pkgs; [ 
        cava
        cmatrix
        killall
        yazi
        tree
        btop
        bat
        fastfetch
        ani-cli
        ];
}

