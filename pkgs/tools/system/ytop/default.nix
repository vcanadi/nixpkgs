{ stdenv, rustPlatform, fetchFromGitHub, IOKit }:

assert stdenv.isDarwin -> IOKit != null;

rustPlatform.buildRustPackage rec {
  pname = "ytop";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "cjbassi";
    repo = pname;
    rev = version;
    sha256 = "1158nlg5b93jyljwvf9f2m8m3ph8sksk5dh9sfnvbiifbk4gizv7";
  };

  buildInputs = stdenv.lib.optionals stdenv.isDarwin [ IOKit ];

  cargoSha256 = "0c4xp63fm1n7x8brmx7avqjvcbqi32k6x5ps7h0fh0ign452y7fz";
  verifyCargoDeps = true;

  meta = with stdenv.lib; {
    description = "A TUI system monitor written in Rust";
    homepage = https://github.com/cjbassi/ytop;
    license = licenses.mit;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.unix;
  };
}
