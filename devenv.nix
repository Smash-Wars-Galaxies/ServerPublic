{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  cpprest = pkgs.callPackage ./.nix/cpprest.nix {};
in {
  # https://devenv.sh/packages/
  packages = [
    pkgs.bashInteractive
    pkgs.devenv
    pkgs.git
    pkgs.cmake
    pkgs.lua5_3
    pkgs.libmysqlclient
    pkgs.db
    pkgs.temurin-bin
    pkgs.boost.dev
    pkgs.openssl.dev
    pkgs.zlib.dev
    pkgs.gtest
    pkgs.libgcc.lib
    cpprest
  ];

  languages.cplusplus.enable = true;

  tasks = {
    "swgemu:clean" = {
      exec = ''
        [ -d "$PWD/MMOCoreORB/compile" ] && rm -rf $PWD/MMOCoreORB/compile
      '';
    };
    "swgemu:configure" = {
      exec = ''
        [ ! -d "$PWD/MMOCoreORB/compile" ] && mkdir $PWD/MMOCoreORB/compile
        cd $PWD/MMOCoreORB/compile
        ${pkgs.cmake}/bin/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_REST_SERVER=ON ..
      '';
    };
    "swgemu:build" = {
      exec = ''
        cd $PWD/MMOCoreORB/compile
        ${pkgs.cmake}/bin/cmake --build . --parallel 12 --target all --
      '';
      after = ["swgemu:configure"];
    };
  };

  env = {
    hardeningDisable = ["all"];
  };

  # https://devenv.sh/processes/
  processes = {
    server = {
      exec = "./core3";

      process-compose = {
        is_tty = true;
        working_dir = "./MMOCoreORB/bin";
      };
    };
  };

  # https://devenv.sh/services/
  services.mysql = {
    enable = true;
    ensureUsers = [
      {
        name = "swgemu";
        password = "123456";
        ensurePermissions = {
          "swgemu.*" = "ALL PRIVILEGES";
        };
      }
    ];
    initialDatabases = [
      {
        name = "swgemu";
        schema = ./MMOCoreORB/sql/swgemu.sql;
      }
    ];
  };
}
