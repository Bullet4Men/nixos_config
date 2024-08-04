{
  services = {
    # Enable flatpak
    flatpak.enable = true;
  
    # yggdrasil
    yggdrasil.enable = true;
    yggdrasil.settings = {
      Peers = [
        tcp://95.164.4.146:7676
        quic://37.186.113.100:1515
        tcp://37.186.113.100:1514
        tcp://195.114.14.86:7676
        tls://65.21.57.122:61995
      ];
    };

    # tor
    tor.enable = true;
    tor.client.enable = true;

    # i2p
    i2p.enable = true;

    # SSD TRIM
    fstrim.enable = true;
    fstrim.interval = "weekly";

    # zerotier
    zerotierone.enable = true;
    zerotierone.port = 9993;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
