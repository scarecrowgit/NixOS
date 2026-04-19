{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    ludusavi # For game saves
    proton-vpn # VPN
    github-desktop
    mattermost-desktop
    thunderbird
    ayugram-desktop
    (python3.withPackages (ps: with ps; [ pyftpdlib ]))
    # pokego # Overlayed
  ];
}
