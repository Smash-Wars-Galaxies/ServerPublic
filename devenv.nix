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
    pkgs.gdb
    cpprest
    pkgs.ccache
  ];

  languages.cplusplus.enable = true;
  
  dotenv = {
    enable = false;
    disableHint = true;
  };

  env = {
    hardeningDisable = ["all"];
    CCACHE_DIR = "${config.devenv.root}/state/ccache";
    PROJECT_ROOT = "${config.devenv.root}/MMOCoreORB";
    PROJECT_BUILD = "${config.devenv.root}/MMOCoreORB/compile";
  };

  scripts = {
    "project-update-tre".exec = ''
      ${lib.getExe pkgs.minio-client} alias set smashwg https://s3.hellafast.io $SMASHWG_S3_ACCESS $SMASHWG_S3_SECRET
      ${lib.getExe pkgs.minio-client} mirror --overwrite "smashwg/tre-files/tre/" "$PROJECT_ROOT/bin/tre/"
    '';
    "project-configure".exec = ''
      ${lib.getExe pkgs.cmake} -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_REST_SERVER=ON -S "$PROJECT_ROOT" -B "$PROJECT_BUILD"
    '';
    "project-build".exec = ''
      ${lib.getExe pkgs.cmake} --build "$PROJECT_BUILD" --parallel $(${pkgs.coreutils}/bin/nproc) --target all --
    '';
  };

  tasks = {
    "swgemu:clean".exec = ''[ -d "$PROJECT_BUILD" ] && rm -rf "$PROJECT_BUILD"'';
    "swgemu:configure".exec = ''project-configure'';
    "swgemu:build" = {
      exec = ''project-build'';
      after = ["swgemu:configure"];
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

  enterTest = ''
    project-update-tre

    wait_for_port 3306 # Wait for MySQL
    while ! "${pkgs.mariadb}/bin/mysql" -h"localhost" -u"swgemu" -p"123456" -e "USE swgemu;" 2>/dev/null; do
      sleep 1
    done

    cd MMOCoreORB/bin
    cp conf/config.lua.example conf/config.lua && cat conf/config.lua
    ./core3 runUnitTests --gtest_output=xml:core3_tests.xml
  '';
}
