{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let
    myHask = haskellPackages.extend (
        haskell.lib.packageSourceOverrides {
            franz = ./.;
        });
in myHask.shellFor {
    packages = (hp: with hp; [franz]);
    withHoogle = true;
    buildInputs = (with pkgs; [
        haskell-language-server
        ghcid
    ]) ++ (with myHask; [
        implicit-hie
    ]);
}
