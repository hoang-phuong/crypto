cmake_minimum_required (VERSION 3.2)

project(pcrypto CXX)

file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/*.cpp)

add_library(pcrypto STATIC SHARED ${SRC_FILES})
include_directories( ${PROJECT_SOURCE_DIR})
