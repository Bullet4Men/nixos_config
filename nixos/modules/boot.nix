{
  # ntfs support
  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/run/media/user" = { 
    device = "/dev/nvme0n1p3";
    fsType = "ntfs-3g"; 
    options = [ "rw" "uid=1000"];
  };

  
  # Bootloader.

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
    # systemd-boot.enable = true;
  };

  time.hardwareClockInLocalTime = true;
  
  boot.initrd.luks.devices = {
    "luks-9c046c1e-f92e-438c-b6f9-a1d3d06b00d7" = {
      device = "/dev/disk/by-uuid/9c046c1e-f92e-438c-b6f9-a1d3d06b00d7";
      allowDiscards = true; # to allow TRIM requests to the underlying device
    };
  };
}
