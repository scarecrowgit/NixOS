{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    ludusavi # For game saves
    proton-vpn # VPN
    github-desktop
    (python3.withPackages (ps: with ps; [ pyftpdlib ]))
    # pokego # Overlayed
  ];
}
