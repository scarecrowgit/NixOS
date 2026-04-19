{ stdenv }:
stdenv.mkDerivation {
  pname = "sddm-onedark-theme";
  version = "1.0.0";
  dontBuild = true;
  src = ./onedark;
  installPhase = ''
    mkdir -p $out/share/sddm/themes/onedark
    cp -r $src/. $out/share/sddm/themes/onedark/
  '';
}
