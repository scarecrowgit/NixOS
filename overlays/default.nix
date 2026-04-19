{ host, inputs, ... }:
let
  inherit (import ../hosts/${host}/variables.nix) sddmTheme;
in
{
  # Overlay custom derivations into nixpkgs so you can use pkgs.<name>
  additions =
    final: _prev:
    import ../pkgs {
      pkgs = final;
      inherit host;
    };

  # https://wiki.nixos.org/wiki/Overlays
  modifications = final: prev: {
    nur = inputs.nur.overlays.default;
    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
    vesktop = prev.vesktop.override {
      withSystemVencord = false;
      withMiddleClickScroll = true;
    };
    discord = prev.discord.override {
      withVencord = true;
      withOpenASAR = true;
      enableAutoscroll = true;
    };
    morgen = prev.morgen.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final.asar ];
      postInstall = (old.postInstall or "") + ''
        cd $out/opt/Morgen/resources
        asar extract app.asar app_unpacked
        sed -i 's/zj&&ee\.app\.disableHardwareAcceleration()/false/g' app_unpacked/dist/main.js
        asar pack app_unpacked app.asar
        rm -rf app_unpacked
      '';
    });
  };
}
