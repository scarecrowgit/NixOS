{
  config,
  pkgs,
  inputs,
  lib,
  host,
  ...
}:
let
  inherit (import ../../../../hosts/${host}/variables.nix) username;
in
{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "nixossamba";
        "netbios name" = "starship";
        "security" = "user";
        "map to guest" = "bad user";
        "usershare allow guests" = true;
        "usershare path" = "/var/lib/samba/usershares";
      };
      "shared" = {
        "path" = "/home/${username}/shared";
        "browseable" = "yes";
        "read only" = "no";
        "valid users" = username;
        "force user" = username;
        "create mask" = "0664";
        "directory mask" = "0775";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish.enable = true;
    publish.userServices = true;
  };

  users.users.${username}.extraGroups = [ "samba" ];

  systemd.tmpfiles.rules = [
    "d /home/${username}/shared 0755 ${username} users"
  ];
}