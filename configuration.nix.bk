	{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./unfreeList.nix
      ./hardware-configuration.nix
      ./probook440g6GPU.nix
      ./virtualisation.nix
      ./fonts/.
      ./steam/.
    ];

  # Efi bootloader mount pooint
  boot.loader.efi.efiSysMountPoint = "/booty/"; 
 
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Upower
  services.upower.enable = true; 
  # IOS support
  services.usbmuxd.enable = true;
  
  
  networking.hostName = "flutterNix"; 
  networking.networkmanager.enable = true;  

  # time zone.
  time.timeZone = "Europe/Stockholm";

  # internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1"; 
  };
  
  
  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
  
    
  programs.wireshark.enable = true;
  
  # touchpad support 
  services.libinput.enable = true;

  
  users.users.Hedwig = {
    isNormalUser = true;
    extraGroups = [ "wheel" "jackaudio" "docker" "wireshark" ]; 
    packages = with pkgs; [
      wine     
    ];
  };
  users.users.Guest = {
    isNormalUser = true;
    packages = with pkgs; [

    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    libimobiledevice
    ifuse
  ];


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;



  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

