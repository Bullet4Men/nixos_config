{ pkgs, ... } :

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.catppuccin
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];
    
    extraConfig = ''
      # Allow mouse
      set -g mouse on

      # Set weather
      set-option -g status-right "#{weather}"

      # Shift+Alt+vim_key to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Set true color
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Set prefix
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Configure catppuccin theme
      set -g @catppuccin_flavour 'frappe'
      set -g @catppuccin_window_tabs_enabled on
      set -g @catppuccin_date_time "%H:%M"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R
    '';
  };
}
