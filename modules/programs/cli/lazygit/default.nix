{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      home.shellAliases = {
        lg = "lazygit";
      };
      programs.lazygit = {
        enable = true;
        settings = {
          gui = {
            # One Dark Pro Monokai Darker theme
            nerdFontsVersion = "3";
            theme = {
              activeBorderColor = [ "#61afef" "bold" ];
              inactiveBorderColor = [ "#5c6370" ];
              searchingActiveBorderColor = [ "#e5c07b" "bold" ];
              optionsTextColor = [ "#61afef" ];
              selectedLineBgColor = [ "#3e4451" ];
              cherryPickedCommitBgColor = [ "#56b6c2" ];
              cherryPickedCommitFgColor = [ "#121212" ];
              unstagedChangesColor = [ "#e06c75" ];
              defaultFgColor = [ "#abb2bf" ];
            };
          };
          git = {
            overrideGpg = true;
          };
        };
      };
    })
  ];
}
