let
  toml = builtins.readFile ./theme.toml;
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = true;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
      };
      opener = {
        edit = [
          {
            run = "lvim \"$@\"";
            block = true;
          }
        ];

        play = [
          {
            run = "vlc \"$@\"";
            orphan = true;
            for = "unix";
          }
        ];

        open = [
          {
            run = "xdg-open \"$@\"";
            desc = "Open";
          }
        ];
      };
    };
    theme = builtins.fromTOML toml;
  };
}
