{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dacek";
  home.homeDirectory = "/home/dacek";
  home.stateVersion = "25.05"; # Please read the comment before changing.


    imports = [
    ./xdg.nix

    #Packages
    ./pkgs/apps.nix
    ./pkgs/fonts.nix
    ./pkgs/cli-tools.nix
    ./pkgs/theming.nix
    ./pkgs/wm-tools.nix


    #Programs
    ./programs/terminal.nix
    ./programs/git.nix
    ./programs/vscode.nix

    ];

# Dotfiles symlinks

home.file.".config/hypr" = {
  source = ./dotfiles/hypr;
  recursive = true;
};

home.file.".config/matugen" = {
  source = ./dotfiles/matugen;
  recursive = true;
};

home.file.".config/waypaper" = {
  source = ./dotfiles/waypaper;
  recursive = true;
};

home.file.".config/gtk-3.0" = {
  source = ./dotfiles/gtk-3.0;
  recursive = true;
};

home.file.".config/gtk-4.0" = {
  source = ./dotfiles/gtk-4.0;
  recursive = true;
};

home.file.".config/rofi" = {
  source = ./dotfiles/rofi;
  recursive = true;
};

home.file.".config/wlogout" = {
  source = ./dotfiles/wlogout;
  recursive = true;
};


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dacek/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
