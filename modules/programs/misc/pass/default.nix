{
  config,
  pkgs,
  inputs,
  host,
  ...
}:
let
  inherit (import ../../../../hosts/${host}/variables.nix) username;
  privateDir = "/home/${username}/.private";
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.users.${username} = {
    programs.password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "${privateDir}/password-store";
        PASSWORD_STORE_GPG = "gpg2";
        PASSWORD_STORE_KEY = "";
        PASSWORD_STORE_GENERATE = "15";
        PASSWORD_STORE_UMASK = "077";
      };
    };

    home.sessionVariables = {
      GNUPGHOME = "${privateDir}/gnupg";
    };
  };

  environment.systemPackages = with pkgs; [
    pass
  ];
}