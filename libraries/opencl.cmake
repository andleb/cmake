message("\nOPENCL.CMAKE")

find_package(OpenCL REQUIRED)


if( NOT PROJECT_LINK_LIBS OR $PROJECT_LINK_LIBS STREQUAL "" )
    set( PROJECT_LINK_LIBS ${OpenCL_LIBRARIES})
    message("opencl-previously empty: ${PROJECT_LINK_LIBS}")
else()
    set( PROJECT_LINK_LIBS "${PROJECT_LINK_LIBS}" ${OpenCL_LIBRARIES})
    message("opencl-previously nonempty: ${PROJECT_LINK_LIBS}")
endif()


