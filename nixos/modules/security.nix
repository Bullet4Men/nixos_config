{
  # Enable apparmor
  security.apparmor.enable = true;

  # Enable firejail
  programs.firejail.enable = true;

  # Enable clamav
  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };

  # haveged entropy daemon
  services.haveged.enable = true;
}
