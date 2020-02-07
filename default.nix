self: super:

let

  # The radare2 and cutter update is (for now) only available in the nixos-unstable-small channel.
  srcs = {
    radare2-nix = super.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixpkgs/4d676594ac9cbfe5172a6997b2d653b31176dbb6/pkgs/development/tools/analysis/radare2/default.nix";
      sha256 = "0a4gk8fv6capka2zq10zl81amr8q032fc30nr8awz8llvbjnpmif";
    };
    cutter-nix = super.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixpkgs/4d676594ac9cbfe5172a6997b2d653b31176dbb6/pkgs/development/tools/analysis/radare2/cutter.nix";
      sha256 = "0kx8kpkqrzfq1q8zlc7iczkd6ga5gd38kjk4b04c68rr03bkw4r5";
    };
  };

in {
  inherit (super.callPackage srcs.radare2-nix {}) radare2 r2-for-cutter;
  cutter = self.libsForQt5.callPackage srcs.cutter-nix {};

  cutter-with-plugins = self.callPackage ./cutter-with-plugins.nix {};

  # Plugins
  r2ghidra-dec = self.libsForQt5.callPackage ./plugins/r2ghidra-dec.nix {};
}
