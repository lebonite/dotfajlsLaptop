{ pkgs, config, lib, ...}:
# all my virtualisation needs are declared here, like qemu/kvm and docker

{ 

  programs = {
    virt-manager.enable = true;
    dconf.enable = true; #virt-manager wont remember stuff without
  };



  users.groups.libvirtd.members = [ "Hedwig" ]; #we dont want to run with sudo




  virtualisation = {

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = [(pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd];
          };
       };
    };
  
    docker = {
      enable = true;
      enableOnBoot = false;
    }; 
    spiceUSBRedirection.enable = true;
  };



  # Enable ISC DHCP Server
#  services.dhcpd = {
 #   enable = true;
 #   interfaces = [ "br-22e3c7731c84" ];  # Specify the bridge interface
 #   config = ''
 #     subnet 172.18.0.0 netmask 255.255.0.0 {
 #       range 172.18.100.0 172.18.100.100;  # Set the DHCP range
 #       option routers 172.18.0.1;         # Default gateway (your host IP)
        #option domain-name-servers 8.8.8.8, 8.8.4.4;  # DNS servers (optional)
  #    }
  #  '';
  #};


}

