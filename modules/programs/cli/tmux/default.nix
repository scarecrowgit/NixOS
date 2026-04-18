{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.tmux = {
        enable = true;
        clock24 = true;
        keyMode = "vi";
        terminal = "screen-256color";
        historyLimit = 1000000;
        plugins = with pkgs.tmuxPlugins; [
          sensible
          vim-tmux-navigator
        ];
        extraConfig = ''
          # Terminal overrides for true color
          set-option -g terminal-overrides ',xterm-256color:RGB'

          # Prefix
          unbind C-b
          set -g prefix C-a
          bind C-a send-prefix

          # Options
          set -g mouse on
          set -g base-index 1
          set -g pane-base-index 1
          set -g detach-on-destroy off
          set -g escape-time 10
          set -g renumber-windows on
          set -g set-clipboard on
          set -g status-position top
          set -g allow-rename off
          set-window-option -g pane-base-index 1

          # One Dark Pro Monokai Darker theme
          set -g status-style "bg=#0f0f0f"
          set -g window-style "fg=colour247,bg=default"
          set -g window-active-style "fg=colour255,bg=default"
          setw -g window-status-current-style "bg=#4276ff"
          set -g status-right-style "fg=colour247"
          set -g status-right "%d %b %H:%M"
          set -g pane-border-style "fg=#3e4451"
          set -g pane-active-border-style "fg=#61afef"
          set -g message-style "bg=#1a1a1a,fg=#abb2bf"

          # Tmux sessionizer
          bind-key -r f run-shell "tmux neww tmux-sessionizer"

          # Tmux binds
          bind r command-prompt "rename-window %%"
          bind R source-file ~/.config/tmux/tmux.conf
          bind S choose-session
          bind u choose-session
          bind w list-windows
          bind * setw synchronize-panes
          bind P set pane-border-status
          bind -n C-M-c kill-pane
          bind x swap-pane -D
          bind z resize-pane -Z

          # Select panes
          bind h select-pane -L
          bind l select-pane -R
          bind k select-pane -U
          bind j select-pane -D

          # Resize panes
          bind -n M-Left resize-pane -L 2
          bind -n M-Right resize-pane -R 2
          bind -n M-Up resize-pane -U 2
          bind -n M-Down resize-pane -D 2

          # Splits
          bind | split-window -h -c "#{pane_current_path}"
          bind [ split-window -h -c "#{pane_current_path}"
          bind - split-window -v -c "#{pane_current_path}"
          bind ] split-window -v -c "#{pane_current_path}"
          bind c new-window -c "#{pane_current_path}"

          # Select windows
          bind -n S-Left  previous-window
          bind -n S-Right next-window
          bind -n C-M-h  previous-window
          bind -n C-M-l next-window

          # vi mode
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        '';
      };
    })
  ];
}
