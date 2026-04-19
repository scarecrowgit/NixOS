{
  pkgs,
  lib,
  ...
}:
let
  wallpaper = ../themes/wallpapers/abstract-matte-black-CYAN-5k-8-BIT.png;
  themeConf = ./sddm-themes/cyan-leaves.conf;

  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "purple_leaves";
  }).overrideAttrs (old: {
    installPhase = old.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${wallpaper} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/cyan_wallpaper.png
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Themes/
      cp ${themeConf} $out/share/sddm/themes/sddm-astronaut-theme/Themes/cyan-leaves.conf
      sed -i "s|ConfigFile=Themes/.*\.conf|ConfigFile=Themes/cyan-leaves.conf|" \
        $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
    '';
  });

  sddmDependencies = [
    sddm-astronaut
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtvirtualkeyboard
  ];
in
{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      autoNumlock = true;
      package = lib.mkForce pkgs.kdePackages.sddm;
      extraPackages = sddmDependencies;
      settings.Theme.CursorTheme = "Bibata-Modern-Classic";
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = sddmDependencies;
}
