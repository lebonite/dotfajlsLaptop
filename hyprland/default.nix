  { lib, pkgs, config, ... }:
    

  {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "~/.dotfiles/wallpapers/DSC00319.JPG";
        wallpaper = "eDP-1,~/.dotfiles/wallpapers/DSC00319.JPG";

      };

    };

  }
