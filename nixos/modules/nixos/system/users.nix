{ lib, config, pkgs, ... }:

{
    users.users.dacek = {
        isNormalUser = true;
        description = "Dawid Czachor";
        extraGroups = [ "networkmanager" "wheel" ];
        home = "/home/dacek";
        #createHome = true;
        shell = pkgs.fish;
    };
}