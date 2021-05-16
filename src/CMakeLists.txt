cmake_minimum_required (VERSION 2.8)

file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.c)

add_library(pcrypto_static STATIC ${SRC_FILES})
add_library(pcrypto_shared SHARED ${SRC_FILES})

target_include_directories(pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/src)

list(APPEND GCC_OPTIONS
    "-std=c99"
    "-Os"
    "-Wall"
    "-Wextra"
    "-Werror"
    "-Wundef"
    "-Wshadow"
    "-Wpointer-arith"
    "-Wcast-align"
    "-Wstrict-prototypes"
    "-Wwrite-strings"
    "-Waggregate-return"
    "-Wcast-qual"
    "-Wswitch-default"
    "-Wswitch-enum"
    "-Wconversion"
    "-Wunreachable-code"
    "-pipe"
    "-fstack-protector-strong"
)

target_compile_options(pcrypto_static PRIVATE ${GCC_OPTIONS})
target_compile_options(pcrypto_shared PRIVATE ${GCC_OPTIONS})
