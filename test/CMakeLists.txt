cmake_minimum_required (VERSION 2.8)

file(GLOB_RECURSE TEST_SRC_FILES ${PROJECT_SOURCE_DIR}/test/*.cpp)

add_executable(test_pcrypto_static ${TEST_SRC_FILES})
add_executable(test_pcrypto_shared ${TEST_SRC_FILES})

target_link_libraries(test_pcrypto_static pcrypto_static)
target_link_libraries(test_pcrypto_shared pcrypto_shared)

target_include_directories(test_pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(test_pcrypto_static PUBLIC ${PROJECT_SOURCE_DIR}/test)
target_include_directories(test_pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_include_directories(test_pcrypto_shared PUBLIC ${PROJECT_SOURCE_DIR}/test)

list(APPEND TEST_COMPILER_OPTIONS
    "-std=c++11"
    "-Wall"
    "-Wextra"
)

target_compile_options(test_pcrypto_static PRIVATE ${TEST_COMPILER_OPTIONS})
target_compile_options(test_pcrypto_shared PRIVATE ${TEST_COMPILER_OPTIONS})

target_compile_definitions(test_pcrypto_static PRIVATE DYNAMIC_LINKING=0)
target_compile_definitions(test_pcrypto_shared PRIVATE DYNAMIC_LINKING=1)
