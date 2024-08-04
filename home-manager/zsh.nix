{ config, pkgs, ... }: 

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "/etc/nixos";
	      EDITOR = "lvim";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "sudo nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
      clr = "sudo nix-collect-garbage -d";

      hms = "home-manager switch --flake ${flakeDir}";

      conf = "sudo ${EDITOR} ${flakeDir}/nixos/configuration.nix";
      pkgs = "sudo ${EDITOR} ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      v = "${EDITOR}";

    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    initExtra = ''
      source ~/.p10k.zsh
    ''; 

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell"; # blinks is also really nice
    };
  };
}
