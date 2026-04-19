{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      xdg.desktopEntries.morgen = {
        name = "Morgen";
        exec = "morgen %U";
        terminal = false;
        type = "Application";
        icon = "morgen";
        startupWMClass = "Morgen";
        comment = "Calendar and Tasks";
        mimeType = [ "text/calendar" "x-scheme-handler/morgen" ];
        categories = [ "Utility" ];
      };
    })
  ];
}
