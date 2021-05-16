cmake_minimum_required (VERSION 2.8)

file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.cpp)

add_library(pcrypto_static STATIC ${SRC_FILES})
add_library(pcrypto_shared SHARED ${SRC_FILES})

target_include_directories(pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/src)

list(APPEND COMPILER_OPTIONS
    "-std=c++11"
    "-Wall"
    "-Wextra"
    "-Werror"
)

if(RELEASE_BUILD)
    list(APPEND COMPILER_OPTIONS
        "-O3"
    )
else()
    list(APPEND COMPILER_OPTIONS
        "-O0"
        "-g"
    )
endif()

target_compile_options(pcrypto_static PRIVATE ${COMPILER_OPTIONS})
target_compile_options(pcrypto_shared PRIVATE ${COMPILER_OPTIONS})
