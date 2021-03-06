message("\nDEFINITIONS.CMAKE")

set( CMAKE_CXX_STANDARD 17 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
#set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17" )

message("COMPILER_ID:${CMAKE_CXX_COMPILER_ID}")
message("STANDARD:${CMAKE_CXX_STANDARD}")

# prefer to set the warning flags in IDE
if( CMAKE_CXX_COMPILER_ID MATCHES "GNU" )
    message( "USING GCC" )
    # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -Wno-unused-macros")

# for linking against libc++ on linux
# if qtcreator sets CMAKE_CXX_COMPILER in kit selection
elseif( CMAKE_CXX_COMPILER_ID MATCHES "clang" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang" )
    message( "USING CLANG" )

    # NOTE: this overrides setting clang++-8
#    set(CMAKE_CXX_COMPILER "clang++")
    # Done in IDE instead
#    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++" )
#    set( CMAKE_EXE_LINKER_FLAGS "-lc++abi" )

    # set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-unused-macros -Wno-newline-eof\
    # -Wno-exit-time-destructors -Wno-global-constructors -Wno-gnu-zero-variadic-macro-arguments\
    # -Wno-documentation -Wno-shadow -Wno-missing-prototypes -Wno-vla\
    # -Wno-padded" )
else()
    message( WARNING "DID NOT MATCH A COMPILER!")
    return()
endif()

# add filesystem support

if(CMAKE_EXE_LINKER_FLAGS MATCHES "lc\\+\\+")
	message("USING LIBC++")
	# Not needed since libc++ 9.0
 #   	link_libraries(c++fs)
 #   	if(NOT CMAKE_EXE_LINKER_FLAGS MATCHES "lc\\+\\+fs")
	# 	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lc++fs")
	# endif()
else()
   	message("USING LIBSTDC++")
   	link_libraries(stdc++fs)
   	if(NOT CMAKE_EXE_LINKER_FLAGS MATCHES "lstdc\\+\\+fs")
   		set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lstdc++fs" )
   	endif()
endif()

message("CMAKE_EXE_LINKER_FLAGS: " ${CMAKE_EXE_LINKER_FLAGS})
message("CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS})
