{
  programs.git = {
    enable = true;
    userName = "Bullet4Men";
    userEmail = "BiffleKitten1122@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
