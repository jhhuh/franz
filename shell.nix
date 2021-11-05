{ pkgs ? import <nixpkgs> {} }:
let
  myHask = pkgs.ghc.withHoogle (hp: with hp; [
    haskell-language-server
    ghcid
    #
    bytestring
    cereal
    containers
    concurrent-resource-map
    cpu
    deepseq
    directory
    exceptions
    fast-builder
    filepath
    fsnotify
    hashable
    mtl
    network
    optparse-applicative
    process
    retry
    sendfile
    stm
    stm-delay
    text
    transformers
    unboxed-ref
    vector
    unordered-containers
  ]);
in pkgs.mkShell {
  buildInputs = [ myHask ] ++ (with pkgs; [cabal-install]);
}
