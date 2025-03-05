{ config, pkgs, lib, ... }:

{

  imports = 
    [
      ./git.nix
    ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "Hedwig";
  home.homeDirectory = "/home/Hedwig";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
      discord 
      librewolf
      lutris  



    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "update-flake" ''
    #   nix flake update ~/.dotfiles/
    # '')
  ];



  # Enable certain unfree software                               
    nixpkgs.config.allowUnfreePredicate = pkg:
     builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
      "steam"
      "steam-original"
    ];


  # Hyprland
    programs.wofi.enable = true;
    programs.kitty.enable = true;
    wayland.windowManager.hyprland.enable = true;
 
  # Hyprland settings

    wayland.windowManager.hyprland.settings = {
 
   # monitor = "DP-1, 3440x1440@144,0x0,1";
   # monitor = "DP-2, 1280x960@90,3440x0,1";   
    
    input = { 
        kb_layout = "se";
    };
    
    "$mod" = "SUPER";
    bind = 
      [
        "$mod, F, exec, librewolf"
        "$mod, X, exec, kitty"

        "$mod, Q, killactive"
        "$mod, V, togglefloating"	
	"bind = $mod, M, exit"
        "bind = $mod, R, exec, wofi --show run"
	"bind = $mod, E, exec, $fileManager"
	"bind = $mod, R, exec, $menu"
	"bind = $mod, P, pseudo" # dwindle
	"bind = $mod, J, togglesplit" # dwindle
        "$mod, 1 , workspace, 1"
        "$mod, 2 , workspace, 2"
        "$mod, 3 , workspace, 3"
        "$mod, 4 , workspace, 4"
        "$mod, 5 , workspace, 5"
        "$mod, 6 , workspace, 6"
        "$mod, 7 , workspace, 7"
        "$mod, 8 , workspace, 8"
        "$mod, 9 , workspace, 9"
        "$mod, 10 , workspace, 10"
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "bind = $mod SHIFT, 1, movetoworkspace, 1"
        "bind = $mod SHIFT, 2, movetoworkspace, 2"
        "bind = $mod SHIFT, 3, movetoworkspace, 3"
        "bind = $mod SHIFT, 4, movetoworkspace, 4"
        "bind = $mod SHIFT, 5, movetoworkspace, 5"
        "bind = $mod SHIFT, 6, movetoworkspace, 6"
        "bind = $mod SHIFT, 7, movetoworkspace, 7"
        "bind = $mod SHIFT, 8, movetoworkspace, 8"
        "bind = $mod SHIFT, 9, movetoworkspace, 9"
        "bind = $mod SHIFT, 0, movetoworkspace, 10"
        
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "bindm = ALT, mouse:272, movewindow"
	
	
	
        
         # Ags
         "bind = $mod SHIFT, T,exec, ags run ~/.config/ags/app.ts"


      ];  
      


    general = { 
       gaps_in = 5;
       gaps_out = 5;
       env = "WLR_DRM_NO_ATOMIC,1"; 


       allow_tearing = true;
    }; 

     decoration = { 
       rounding = 10;
       
      
       
       
     };
  }; 


  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lebonite/etc/profile.d/hm-session-vars.sh
  #
  #home.sessionVariables = {
    # EDITOR = "emacs";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}







