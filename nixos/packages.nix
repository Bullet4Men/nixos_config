{ pkgs, ... }: 

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Editors
    vim
    nano
    neovim
    lunarvim
    libsForQt5.kate

    # Web Browsing
    librewolf
    tor-browser
    
    # System Information and Monitoring
    neofetch
    htop
    lshw
    pciutils
    filelight

    # VPNs and proxies
    nekoray
    protonvpn-gui
    zerotierone

    # System tools
    bleachbit
    gparted
    steam-run
    appimage-run
    unzip
    p7zip
    zip
    rar
    bat

    # Security
    firejail
    apparmor-profiles
    apparmor-utils
    clamav
    chkrootkit
    haveged
    lynis
    checksec
    paxtest

    # Password Manager
    keepassxc

    # Build and Compilation Tools
    gcc
    gnumake
    ninja
    clang
    clang-tools
    gdb
    cmake
    libgcc
    
    # Auto tools
    autoconf
    automake
    autobuild

    # Networking Tools
    wget
    git
    curl
    
    # Python Development
    python3
    python311Packages.pip
    python311Packages.debugpy
    virtualenv

    # Java
    openjdk

    # File Management and Navigation
    ranger
    thefuck
    fzf
    
    # Text Processing
    vale
    vale-ls
    
    # Office Suite
    libsForQt5.kcalc
    libreoffice

    # xdg portals
    kdePackages.xdg-desktop-portal-kde    
    libsForQt5.xdg-desktop-portal-kde
    xdg-desktop-portal
    xdg-desktop-portal-gtk

    # PDF reader
    libsForQt5.okular

    # Services
    i2p

    # Torrent
    libsForQt5.ktorrent
    syncthing

    # Crypto Wallets
    monero-gui

    # Chatting
    element-desktop

    # Multimedia
    vlc

    # NixOS 
    home-manager
    patchelf
  ];

  # Nerdfonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  ];
}
