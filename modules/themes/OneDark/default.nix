{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (
      { config, ... }:
      {
        qt = {
          enable = true;
          platformTheme.name = "gtk";
          style.name = "kvantum";
        };
        gtk = {
          enable = true;
          gtk2.force = true;
          theme = {
            name = "Graphite-Dark";
            package = pkgs.graphite-gtk-theme.override {
              tweaks = [ "darker" ];
            };
          };
          iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
          };
          gtk3.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
          };
          gtk4.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
          };
        };

        home.sessionVariables = {
          ADW_COLOR_SCHEME = "prefer-dark"; # Libadwaita
        };

        dconf.settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };

        home.pointerCursor = {
          gtk.enable = true;
          x11.enable = true;
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };

        xdg.configFile = {
          "Kvantum/GraphiteDark/GraphiteDark.kvconfig".text = ''
            [%General]
            author=One Dark adapted
            comment=A dark theme matching One Dark Pro
            x11drag=menubar_and_primary_toolbar
            spread_progressbar=true
            composite=true
            menu_shadow_depth=7
            tooltip_shadow_depth=0
            scroll_width=8
            scroll_arrows=false
            transient_scrollbar=true
            slider_width=4
            slider_handle_width=18
            slider_handle_length=18
            center_toolbar_handle=true
            check_size=16
            textless_progressbar=false
            progressbar_thickness=4
            menubar_mouse_tracking=true
            merge_menubar_with_toolbar=true
            small_icon_size=16
            large_icon_size=32
            button_icon_size=16
            toolbar_icon_size=22
            combo_as_lineedit=true
            animate_states=true
            no_window_pattern=false
            layout_spacing=2
            submenu_overlap=0
            tooltip_delay=150
            groupbox_top_label=true
            joined_inactive_tabs=true
            scroll_min_extent=60
            fill_rubberband=false
            tree_branch_line=true
            inline_spin_indicators=true
            vertical_spin_indicators=false
            combo_menu=true
            hide_combo_checkboxes=true
            toolbar_interior_spacing=2
            toolbar_separator_thickness=1
            contrast=1.0
            intensity=1.0
            saturation=1.0
            dialog_button_layout=0
            click_behavior=0
            scrollbar_in_view=false
            opaque=krita,kdenlive,digikam
          '';
          "Kvantum/kvantum.kvconfig".text = ''
            [General]
            theme=GraphiteDark
          '';
        };
      }
    )
  ];
}
