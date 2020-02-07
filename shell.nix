{ pkgs ? import <nixpkgs> {} }:

with pkgs.extend (import ./default.nix);

mkShell {
  XDG_DATA_HOME = "${r2ghidra-dec}/share";
  R2_LIBR_PLUGINS = "${r2ghidra-dec}/share/radare2/plugins";

  buildInputs = [ radare2 cutter r2ghidra-dec ];
}
