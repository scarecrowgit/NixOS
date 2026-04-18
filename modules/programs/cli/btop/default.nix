{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.btop = {
        enable = true;
        package = pkgs.btop.override {
          rocmSupport = true;
          cudaSupport = true;
        };
        settings = {
          color_theme = "onedark";
          show_gpu_info = "on";
          cpu_sensor = "auto";
          vim_keys = true;
          rounded_corners = true;
          proc_tree = false;
          show_uptime = true;
          show_coretemp = true;
          show_disks = true;
          only_physical = true;
          io_mode = true;
          io_graph_combined = false;
        };
        themes.onedark = ''
          # One Dark Pro Monokai Darker theme for btop

          # Main background, empty for terminal default
          theme[main_bg]="#121212"

          # Main text color
          theme[main_fg]="#abb2bf"

          # Title color for boxes
          theme[title]="#abb2bf"

          # Highlight color for keyboard shortcuts
          theme[hi_fg]="#61afef"

          # Background color of selected item in processes box
          theme[selected_bg]="#3e4451"

          # Foreground color of selected item in processes box
          theme[selected_fg]="#61afef"

          # Color of inactive/disabled text
          theme[inactive_fg]="#5c6370"

          # Color of text appearing on top of graphs
          theme[graph_text]="#abb2bf"

          # Background color of the percentage meters
          theme[meter_bg]="#3e4451"

          # Misc colors for processes box
          theme[proc_misc]="#56b6c2"

          # CPU, Memory, Network, Proc box outline colors
          theme[cpu_box]="#c678dd"
          theme[mem_box]="#98c379"
          theme[net_box]="#e06c75"
          theme[proc_box]="#61afef"

          # Box divider line and small boxes line color
          theme[div_line]="#5c6370"

          # Temperature graph color (Green -> Yellow -> Red)
          theme[temp_start]="#98c379"
          theme[temp_mid]="#e5c07b"
          theme[temp_end]="#e06c75"

          # CPU graph colors (Cyan -> Blue -> Magenta)
          theme[cpu_start]="#56b6c2"
          theme[cpu_mid]="#61afef"
          theme[cpu_end]="#c678dd"

          # Mem/Disk free meter (Magenta -> Blue)
          theme[free_start]="#c678dd"
          theme[free_mid]="#61afef"
          theme[free_end]="#56b6c2"

          # Mem/Disk cached meter (Blue -> Cyan)
          theme[cached_start]="#61afef"
          theme[cached_mid]="#56b6c2"
          theme[cached_end]="#98c379"

          # Mem/Disk available meter (Yellow -> Red)
          theme[available_start]="#e5c07b"
          theme[available_mid]="#d19a66"
          theme[available_end]="#e06c75"

          # Mem/Disk used meter (Green -> Cyan)
          theme[used_start]="#98c379"
          theme[used_mid]="#56b6c2"
          theme[used_end]="#61afef"

          # Download graph colors (Yellow -> Red)
          theme[download_start]="#e5c07b"
          theme[download_mid]="#d19a66"
          theme[download_end]="#e06c75"

          # Upload graph colors (Green -> Cyan)
          theme[upload_start]="#98c379"
          theme[upload_mid]="#56b6c2"
          theme[upload_end]="#61afef"

          # Process box color gradient (Blue -> Magenta)
          theme[process_start]="#61afef"
          theme[process_mid]="#56b6c2"
          theme[process_end]="#c678dd"
        '';
      };
    })
  ];
}
