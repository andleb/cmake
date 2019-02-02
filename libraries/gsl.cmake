find_package( GSL )

if (GSL_FOUND)
    include_directories(${GSL_INCLUDE_DIR})
    string(STRIP "${GSL_LIBRARIES}" GSL_LIBRARIES )
    if( NOT PROJECT_LINK_LIBS OR $PROJECT_LINK_LIBS STREQUAL "" )
        set( PROJECT_LINK_LIBS "${GSL_LIBRARIES}" )
        message( "GSL-empty:${PROJECT_LINK_LIBS}" )
    else()
        set( PROJECT_LINK_LIBS "${PROJECT_LINK_LIBS} ${GSL_LIBRARIES}" )
        message( "GSL-nonempty:${PROJECT_LINK_LIBS}" )
    endif()
endif()