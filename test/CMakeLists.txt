cmake_minimum_required (VERSION 2.8)

file(GLOB_RECURSE TEST_SRC_FILES ${PROJECT_SOURCE_DIR}/test/*.c)

add_executable(test_pcrypto_static ${TEST_SRC_FILES})
add_executable(test_pcrypto_shared ${TEST_SRC_FILES})

target_link_libraries(test_pcrypto_static pcrypto_static)
target_link_libraries(test_pcrypto_shared pcrypto_shared)

target_include_directories(test_pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(test_pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/test)
target_include_directories(test_pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(test_pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/test)

list(APPEND TEST_GCC_OPTIONS
    "-std=c99"
    "-Og"
    "-g"
    "-Wall"
    "-Wextra"
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

target_compile_options(test_pcrypto_static PRIVATE ${TEST_GCC_OPTIONS})
target_compile_options(test_pcrypto_shared PRIVATE ${TEST_GCC_OPTIONS})

target_compile_definitions(test_pcrypto_static PRIVATE DYNAMIC_LINKING=0)
target_compile_definitions(test_pcrypto_static PRIVATE DYNAMIC_LINKING=1)
