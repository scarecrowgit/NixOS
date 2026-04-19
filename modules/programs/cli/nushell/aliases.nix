{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.nushell.shellAliases = {
        # Navigation
        ".."  = "cd ..";
        "..." = "cd ../..";

        # Listing
        ll = "ls -l";
        la = "ls -la";

        # Editors
        v   = "nvim";
        vim = "nvim";

        # Git
        g   = "git";
        gs  = "git status";
        ga  = "git add";
        gc  = "git commit";
        gp  = "git push";
        gl  = "git log";
        gd  = "git diff";
        gco = "git checkout";
        gb  = "git branch";

        # Utilities
        wttr = "curl wttr.in";

        # NixOS
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#Default";
        update  = "nix flake update";
        clean   = "sudo nix-collect-garbage -d";
      };
    })
  ];
}
