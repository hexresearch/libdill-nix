{ stdenv, autoconf, automake, libtool, fetchFromGitHub  }:
stdenv.mkDerivation rec {
  pname = "libdill";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "sustrik";
    repo = "libdill";
    rev = "de7a917bc39756f61237b8b779dd8be735652f88";
    sha256 = "1j570wzk9q8k1npg7zvaaglcip9l7k447rim3r4biibrl9qg2w14";
  };
  nativeBuildInputs = [ autoconf automake  ];
  buildInputs = [ libtool ];
  patches = [ ./gcc-9.1.patch ];

  preConfigure = ''
    ./autogen.sh
  '';

  /* installPhase = ''
    ls .
  ''; */
}
