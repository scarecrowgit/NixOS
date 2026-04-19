{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.kitty = {
        enable = true;
        font = {
          size = 10.0;
          name = "monospace";
        };
        settings = {
          # shell = "${getExe pkgs.tmux}";
          # cursor_trail = 3; # Fancy cursor movements (especially in nixvim)
          # cursor_trail_decay = "0.08 0.3"; # Animation speed
          # cursor_trail_start_threshold = "4";
          strip_trailing_spaces = "smart";
          macos_option_as_alt = "yes";
          macos_quit_when_last_window_closed = true;
          copy_on_select = "yes";
          confirm_os_window_close = 0;
          scrollback_lines = 10000;
          enable_audio_bell = false;
          mouse_hide_wait = 60;
          update_check_interval = 0;

          # One Dark Pro Monokai Darker colors
          background = "#121212";
          foreground = "#bbbbbb";
          cursor = "#f8f8f0";
          cursor_text_color = "#121212";
          selection_background = "#3e4451";
          selection_foreground = "#d7dae0";
          url_color = "#61afef";

          # Normal colors
          color0 = "#121212";
          color1 = "#e06c75";
          color2 = "#98c379";
          color3 = "#e5c07b";
          color4 = "#61afef";
          color5 = "#c678dd";
          color6 = "#56b6c2";
          color7 = "#abb2bf";

          # Bright colors
          color8 = "#5c6370";
          color9 = "#e06c75";
          color10 = "#98c379";
          color11 = "#e5c07b";
          color12 = "#61afef";
          color13 = "#c678dd";
          color14 = "#56b6c2";
          color15 = "#bbbbbb";

          ## Tabs
          tab_title_template = "{index}";
          active_tab_font_style = "normal";
          inactive_tab_font_style = "normal";
          tab_bar_style = "powerline";
          tab_powerline_style = "round";
          active_tab_foreground = "#121212";
          active_tab_background = "#61afef";
          inactive_tab_foreground = "#abb2bf";
          inactive_tab_background = "#1a1a1a";
        };
        # shellIntegration.mode = "no-sudo";
        keybindings = {
          "ctrl+alt+n" = "launch --cwd=current";
          "alt+w" = "copy_and_clear_or_interrupt";
          "ctrl+y" = "paste_from_clipboard";
          "alt+1" = "goto_tab 1";
          "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "alt+5" = "goto_tab 5";
          "alt+6" = "goto_tab 6";
          "alt+7" = "goto_tab 7";
          "alt+8" = "goto_tab 8";
          "alt+9" = "goto_tab 9";
          "alt+0" = "goto_tab 10";

          # Tmux
          "ctrl+t" = "launch --cwd=current --type=overlay tmux-sessionizer";
          # "ctrl+t" = "launch --cwd=current --title tmux-sessionizer tmux-sessionizer";
          "ctrl+shift+left" = "no_op";
          "ctrl+shift+right" = "no_op";
        };
      };
    })
  ];
}
