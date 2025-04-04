  { lib, config, pkgs, ...  }:

  {

      # Fonts
  
  fonts.packages = with pkgs; [
  noto-fonts         
  nerd-fonts._0xproto
  nerd-fonts.droid-sans-mono
  source-han-sans
  source-han-serif 
  ];

  }
