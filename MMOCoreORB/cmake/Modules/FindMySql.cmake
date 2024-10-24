#--------------------------------------------------------
# Copyright (C) 1995-2007 MySQL AB
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# There are special exceptions to the terms and conditions of the GPL
# as it is applied to this software. View the full text of the exception
# in file LICENSE.exceptions in the top-level directory of this software
# distribution.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#
# The MySQL Connector/ODBC is licensed under the terms of the
# GPL, like most MySQL Connectors. There are special exceptions
# to the terms and conditions of the GPL as it is applied to
# this software, see the FLOSS License Exception available on
# mysql.com.

##########################################################################

IF (MYSQL_INCLUDE_DIR)
  SET(MySql_FIND_QUIETLY_INCLUDE TRUE)
ENDIF (MYSQL_INCLUDE_DIR)

IF (MYSQL_LIB)
  SET(MySql_FIND_QUIETLY_LIB TRUE)
ENDIF (MYSQL_LIB)

#-------------- FIND MYSQL_INCLUDE_DIR ------------------
FIND_PATH(MYSQL_INCLUDE_DIR mysql.h
    PATH_SUFFIXES
      mysql
    PATHS
        /usr/include/mysql
        /opt/mysql/mysql/include
        /opt/mysql/include
        /opt/local/include/mysql5
        /opt/local/include/mysql51
        /opt/local/include/mysql56
        /usr/local/mysql/include
	      /usr/local/opt/mysql-client/include/mysql
        $ENV{ProgramFiles}/MySQL/*/include
        $ENV{SystemDrive}/MySQL/*/include)

#----------------- FIND MYSQL_LIB_DIR -------------------
IF (WIN32)
  # Set lib path suffixes
  # dist = for mysql binary distributions
  # build = for custom built tree
  IF (CMAKE_BUILD_TYPE STREQUAL Debug)
    SET(libsuffixDist debug)
    SET(libsuffixBuild Debug)
  ELSE (CMAKE_BUILD_TYPE STREQUAL Debug)
    SET(libsuffixDist opt)
    SET(libsuffixBuild Release)
    ADD_DEFINITIONS(-DDBUG_OFF)
  ENDIF (CMAKE_BUILD_TYPE STREQUAL Debug)

  FIND_LIBRARY(MYSQL_LIB NAMES mysqlclient
          PATHS
          $ENV{MYSQL_DIR}/lib/${libsuffixDist}
          $ENV{MYSQL_DIR}/libmysql
          $ENV{MYSQL_DIR}/libmysql/${libsuffixBuild}
          $ENV{MYSQL_DIR}/client/${libsuffixBuild}
          $ENV{MYSQL_DIR}/libmysql/${libsuffixBuild}
          $ENV{ProgramFiles}/MySQL/*/lib/${libsuffixDist}
          $ENV{SystemDrive}/MySQL/*/lib/${libsuffixDist})
ELSE (WIN32)
  FIND_LIBRARY(MYSQL_LIB NAMES mysqlclient
          PATHS
          /usr/lib/mysql
          /usr/local/lib/mysql
          /usr/local/mysql/lib
          /usr/local/mysql/lib/mysql
          /opt/local/mysql5/lib
          /opt/local/lib/mysql5/mysql
          /opt/local/lib/mysql56/mysql
          /opt/mysql/mysql/lib/mysql
	  /usr/local/opt/mysql-client/lib
          /opt/mysql/lib/mysql)
ENDIF (WIN32)

IF(MYSQL_LIB)
  GET_FILENAME_COMPONENT(MYSQL_LIB_DIR ${MYSQL_LIB} PATH)
ENDIF(MYSQL_LIB)

IF (MYSQL_INCLUDE_DIR AND MYSQL_LIB_DIR)
  SET(MYSQL_FOUND TRUE)

  INCLUDE_DIRECTORIES(${MYSQL_INCLUDE_DIR})
  LINK_DIRECTORIES(${MYSQL_LIB_DIR})

  FIND_LIBRARY(MYSQL_ZLIB zlib PATHS ${MYSQL_LIB_DIR})
  FIND_LIBRARY(MYSQL_TAOCRYPT taocrypt PATHS ${MYSQL_LIB_DIR})
  SET(MYSQL_CLIENT_LIBS mysqlclient)
  IF (MYSQL_ZLIB)
    SET(MYSQL_CLIENT_LIBS ${MYSQL_CLIENT_LIBS} zlib)
  ENDIF (MYSQL_ZLIB)
  IF (MYSQL_TAOCRYPT)
    SET(MYSQL_CLIENT_LIBS ${MYSQL_CLIENT_LIBS} taocrypt)
  ENDIF (MYSQL_TAOCRYPT)
  # Added needed mysqlclient dependencies on Windows
  IF (WIN32)
    SET(MYSQL_CLIENT_LIBS ${MYSQL_CLIENT_LIBS} ws2_32)
  ENDIF (WIN32)

  if(MYSQL_INCLUDE_DIR AND EXISTS "${MYSQL_INCLUDE_DIR}/mysql_version.h" )
    file( STRINGS "${MYSQL_INCLUDE_DIR}/mysql_version.h"
            MYSQL_VERSION_H REGEX "^#define[ \t]+MYSQL_SERVER_VERSION[ \t]+\"[^\"]+\".*$" )
    string( REGEX REPLACE
            "^.*MYSQL_SERVER_VERSION[ \t]+\"([^\"]+)\".*$" "\\1" MYSQL_VERSION_STRING
            "${MYSQL_VERSION_H}" )

    file( STRINGS "${MYSQL_INCLUDE_DIR}/mysql_version.h"
            LIBMYSQL_VERSION_H REGEX "^#define[ \t]+LIBMYSQL_VERSION[ \t]+\"[^\"]+\".*$" )
    string( REGEX REPLACE
            "^.*LIBMYSQL_VERSION[ \t]+\"([^\"]+)\".*$" "\\1" LIBMYSQL_VERSION_STRING
            "${LIBMYSQL_VERSION_H}" )
  endif()

  IF (NOT MySql_FIND_QUIETLY_INCLUDE)
    IF (MYSQL_VERSION_STRING)
      MESSAGE(STATUS "Found MySQL server version: ${MYSQL_VERSION_STRING}")
    endif()

    IF (LIBMYSQL_VERSION_STRING)
      MESSAGE(STATUS "Found MySQL library version: ${LIBMYSQL_VERSION_STRING}")
    endif()

    MESSAGE(STATUS "Found MySQL Include dir: ${MYSQL_INCLUDE_DIR}  library dir: ${MYSQL_LIB_DIR}")
  ENDIF (NOT MySql_FIND_QUIETLY_INCLUDE)

  IF (NOT MySql_FIND_QUIETLY_LIB)
    MESSAGE(STATUS "Found MySQL client libraries: ${MYSQL_CLIENT_LIBS}")
  ENDIF (NOT MySql_FIND_QUIETLY_LIB)
ELSEIF (MySql_FIND_REQUIRED)
  MESSAGE(FATAL_ERROR "Cannot find MySQL. Include dir: ${MYSQL_INCLUDE_DIR}  library dir: ${MYSQL_LIB_DIR}")
ENDIF (MYSQL_INCLUDE_DIR AND MYSQL_LIB_DIR)

MARK_AS_ADVANCED(
  MYSQL_LIB_DIR
  MYSQL_TAOCRYPT
  MYSQL_ZLIB
  MYSQL_INCLUDE_DIR
  MYSQL_LIB
)
