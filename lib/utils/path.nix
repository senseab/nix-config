{ lib, pkgs, ... }:
let
  inherit (lib.filesystem) listFilesRecursive;
  inherit (pkgs.stdenv) mkDerivation;
in
{
  toStore =
    dirname: dir:
    listFilesRecursive (mkDerivation {
      name = dirname;
      src = dir;

      buildPhase = ''
        echo [!] current work dir is $(pwd)
        ls -alh
      '';

      installPhase = ''
        mkdir -p $out
        cp -r * $out
      '';
    });
}
