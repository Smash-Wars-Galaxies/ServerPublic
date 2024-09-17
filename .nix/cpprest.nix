{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  boost,
  openssl,
  zlib
}:

stdenv.mkDerivation rec {
  pname = "cpprestsdk";
  version = "2.10.19";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "cpprestsdk";
    rev = "v${version}";
    hash = "sha256-nnLkA3eH0hzeemWP+CYi3pNI0rMYPIC4qjMZimylGRM=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    boost
    openssl
    zlib
  ];

  CXXFLAGS = "-Wno-format-truncation";

  meta = {
    description = "The C++ REST SDK is a Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design. This project aims to help C++ developers connect to and interact with services";
    homepage = "https://github.com/microsoft/cpprestsdk";
    changelog = "https://github.com/microsoft/cpprestsdk/blob/${src.rev}/changelog.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "cpprestsdk";
    platforms = lib.platforms.all;
  };
}
