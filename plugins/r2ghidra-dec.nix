{ stdenv, fetchFromGitHub, qtbase, cmake, bison, flex, pkgconfig, r2-for-cutter, cutter }:

stdenv.mkDerivation rec {
  pname = "r2ghidra-dec";
  version = "ebac2c56bb18b3ade1038a7fae191417f6b85efd";

  src = fetchFromGitHub {
    owner = "radareorg";
    repo = pname;
    rev = version;
    sha256 = "1g3hdblvh2hld1nyh98v460h53q6vnxjdnilw9pfq0v2aw5anyl7";
    fetchSubmodules = true;
  };

  cmakeFlags = [
    "-DCUTTER_SOURCE_DIR=${cutter.src}"
    "-DBUILD_CUTTER_PLUGIN=ON"
  ];

  nativeBuildInputs = [cmake pkgconfig];
  buildInputs = [bison flex r2-for-cutter qtbase];
}
