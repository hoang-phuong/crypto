cmake_minimum_required (VERSION 3.2)

project(test_pcrypto CXX)

add_subdirectory(framework)

add_executable(test_pcrypto test_main.cpp test_main.hpp)
target_link_libraries(test_pcrypto pcrypto framework)
