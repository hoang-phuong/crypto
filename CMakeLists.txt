cmake_minimum_required (VERSION 3.2)

project(PCrypto CXX)

option(RELEASE_BUILD "Build library with release configuration" OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/bin)

add_subdirectory(src)

if(RELEASE_BUILD)
    add_definitions(-DBUILD_TYPE=RELEASE)
else()
    add_definitions(-DBUILD_TYPE=DEBUG)
    add_subdirectory(test)
endif()

add_compile_options(-std=c++11 -Wall -Wextra -Werror)
