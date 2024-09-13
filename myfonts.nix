{ pkgs ? import <nixpkgs> {} }:

let
  fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "myfonts";
    version = "1.0.0";
    src = ./myfonts;
    dontConfigure = true;

    installPhase = ''
      runHook preInstall
      cp -R share $out/
      runHook postInstall
    '';

    meta = {
      description = "Fonts not in nixpkgs";
    };
  };
in
{
  inherit fonts;
}
