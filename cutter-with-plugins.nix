{ stdenv, makeWrapper, symlinkJoin, cutter }:

  { plugins ? [] }:

  let

    pluginsPath = symlinkJoin {
      name = "cutter-plugins";
      paths = plugins;
    };

  in stdenv.mkDerivation {
    name = "cutter-with-plugins";

    phases = ["installPhase"];

    buildInputs = [makeWrapper];

    installPhase = ''
      mkdir -p $out/bin

      makeWrapper ${cutter}/bin/Cutter $out/bin/Cutter \
        --prefix XDG_DATA_DIRS : "${pluginsPath}/share" \
        --set R2_LIBR_PLUGINS "${pluginsPath}/share/radare2/plugins"
    '';
  }
