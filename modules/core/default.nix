{ ... }:
{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./nh.nix
    ./packages.nix
    ./printing.nix
    ./sddm.nix
    ./security.nix
    ./dns.nix
    ./services.nix
    # ./games.nix
    # ./dlna.nix
    ./syncthing.nix
    ./system.nix
    ./users.nix
    ./programs/misc/pass
    # ./flatpak.nix
    # ./virtualisation.nix
  ];
}
