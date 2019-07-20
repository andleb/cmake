message("\nCOMMON.CMAKE")

# just in case
include_directories("/usr/local/include")

set( MAJOR "")
STRING(REGEX REPLACE "^([0-9]+)\\.+.*" "\\1" MAJOR "${CMAKE_CXX_COMPILER_VERSION}")
message( "MAJOR; ${MAJOR}" )


if( CMAKE_CXX_COMPILER_ID MATCHES "GNU" )
    message( "USING GCC" )
    set( COMPILER "gnu${MAJOR}" )

elseif( CMAKE_CXX_COMPILER_ID MATCHES "clang" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang" )
    message( "USING CLANG" )
    if( CMAKE_EXE_LINKER_FLAGS MATCHES "lc\\+\\+" )
        message( "USING LIBC++" )
        set( COMPILER "clang${MAJOR}libc++" )
    else()
        set( COMPILER "clang${MAJOR}" )
    endif()
else()
    message( WARNING "DID NOT MATCH A COMPILER!")
endif()

if( ${CMAKE_BUILD_TYPE} MATCHES "Debug")
    message( "IN DEBUG MODE" )
    set( DBGSUFFIX "-d" )
else()
    set( DBGSUFFIX "" )
endif()

if( NOT PROJECT_LINK_LIBS OR $PROJECT_LINK_LIBS STREQUAL "" )
    set( PROJECT_LINK_LIBS "libcommon-${COMPILER}${DBGSUFFIX}.so" )
    message( "libcommon-previously empty: ${PROJECT_LINK_LIBS}" )
else()
    message( "libcommon-previously nonempty: ${PROJECT_LINK_LIBS}" )
    set( PROJECT_LINK_LIBS "${PROJECT_LINK_LIBS}" "libcommon-${COMPILER}${DBGSUFFIX}.so" )
    message( "libcommon-previously nonempty: ${PROJECT_LINK_LIBS}" )
endif()
