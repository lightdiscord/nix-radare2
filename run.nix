{ pkgs ? import <nixpkgs> {}, plugins ? [] }:

let
  extendedPkgs = pkgs.extend (import ./default.nix);
in [
  (extendedPkgs.cutter-with-plugins {
    plugins = map (plugin: extendedPkgs.${plugin}) plugins;
  })
]
