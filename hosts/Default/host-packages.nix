{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    proton-vpn # VPN
    github-desktop
    mattermost-desktop
    thunderbird
    ayugram-desktop
    morgen
    notion-app-enhanced
    obs-studio
    (python3.withPackages (ps: with ps; [ pyftpdlib ]))
    # pokego # Overlayed
  ];
}
