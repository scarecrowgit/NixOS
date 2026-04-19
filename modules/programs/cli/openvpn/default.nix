{ config, lib, pkgs, ... }:
let
  username = "vxwwx";
in
{
  imports = [
    (lib.mkIf (config.services.dbus.enable) {
      services.dbus.packages = [ pkgs.openvpn3 ];
    })
  ];

  users.users.openvpn = {
    isSystemUser = true;
    group = "openvpn";
    description = "OpenVPN 3 service user";
  };

  users.groups.openvpn = {};

  users.users.${username}.extraGroups = [ "openvpn" ];

  systemd.tmpfiles.rules = [
    "d /etc/openvpn3/configs 0755 openvpn openvpn - -"
    "d /etc/openvpn3/autoload 0755 openvpn openvpn - -"
  ];

  environment.systemPackages = with pkgs; [
    openvpn3
  ];
}
