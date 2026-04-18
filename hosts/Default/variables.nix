{
  username = "vxwwx"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "hyprland"; # hyprland, i3, gnome, plasma6

  # Theme & Appearance
  bar = "waybar"; # waybar, hyprpanel, noctalia
  waybarTheme = "minimal"; # stylish, minimal
  sddmTheme = "astronaut"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "galaxy.webp"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "galaxy.webp";

  # Default Applications
  terminal = "kitty"; # kitty, alacritty
  editor = "neovim"; # nixvim, vscode, helix, doom-emacs, nvchad, neovim
  browser = "zen-beta"; # zen-beta, firefox, floorp
  fileManager = "yazi"; # yazi, lf, thunar
  shell = "nushell"; # zsh, bash
  games = false; # Enable/Disable gaming module

  # Hardware
  hostname = "starship";
  videoDriver = "amdgpu"; # nvidia, amdgpu, intel
  nvidiaChannel = "legacy_580"; # stable, latest, beta, legacy_xxx
  bluetoothSupport = false; # Whether your motherboard supports bluetooth

  # Localization
  timezone = "Asia/Tbilisi";
  locale = "en_GB.UTF-8";
  clock24h = true;
  kbdLayout = "us";
  kbdVariant = "";
  kbdLayouts = ["us" "ru"];  # Additional layouts
  consoleKeymap = "us";
}
