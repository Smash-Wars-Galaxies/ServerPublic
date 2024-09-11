{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/packages/
  packages = [
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
  ];

  env.hardeningDisable = ["all"];

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
