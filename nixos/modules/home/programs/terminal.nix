{ lib, config, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        package = pkgs.kitty;
        font.name = "FiraCode Nerd Font";
        font.size = 14;
        extraConfig = ''
            background_opacity 0.6
            include colors.conf
        '';
    };

    programs.fish = {
        enable = true;
        shellInit = ''
            fastfetch --logo-color-1 green --logo-color-2 magenta

            set -g fish_greeting ""
        '';

        shellAliases = {
            nrs = "sudo nixos-rebuild switch --flake ~/.config/nixos --impure";
            ff  = "clear && fastfetch --logo-color-1 green --logo-color-2 magenta";
        };
    };



}

