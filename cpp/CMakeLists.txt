cmake_minimum_required(VERSION 3.20)
project(llvm_bridge)

set(CMAKE_CXX_STANDARD 20)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})
llvm_map_components_to_libnames(llvm_libs support core irreader target X86 orcjit)

message(STATUS "Linking LLVM libraries ${llvm_libs}")

find_package(spdlog REQUIRED)

enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIR})

add_library(llvm_bridge STATIC llvm_bridge.cpp helpers.cpp helpers.h TiJIT.h)
target_link_libraries(llvm_bridge PUBLIC ${llvm_libs} spdlog::spdlog)

add_executable(llvm_bridge_test helpers_test.cpp TiJIT_test.cpp llvm_bridge_test.cpp)
target_link_libraries(llvm_bridge_test gtest_main gtest llvm_bridge)