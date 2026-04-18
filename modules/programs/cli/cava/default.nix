{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.cava = {
        enable = true;
        settings = {
          general = {
            framerate = 60;
            sensitivity = 100; # Default
            autosens = 1;
          };
          color = {
            gradient = 1;

            # One Dark Pro Monokai Darker
            gradient_color_1 = "'#56b6c2'";
            gradient_color_2 = "'#61afef'";
            gradient_color_3 = "'#98c379'";
            gradient_color_4 = "'#e5c07b'";
            gradient_color_5 = "'#d19a66'";
            gradient_color_6 = "'#c678dd'";
            gradient_color_7 = "'#e06c75'";
            gradient_color_8 = "'#e06c75'";
          };
        };
      };
    })
  ];
}
