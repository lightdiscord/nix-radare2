# nix-radare2

## How to use ?

Extend `pkgs` with the overlay in `default.nix`.
Then you need to use the `cutter-with-plugins` function (with some plugins).

```nix
pkgs.cutter-with-plugins { plugins = [ pkgs.r2ghidra-dec ] };
```

Then you may add this derivation into `environment.systemPackages` in your `configuration.nix` for example.

Or you can use `nix run` to enter a shell with the specified plugins.

```console
$ nix run -f run.nix --arg plugins '["r2ghidra-dec"]'
```
