cmake_minimum_required(VERSION 2.8.12)

SET(CMAKE_C_COMPILER clang)
SET(CMAKE_CXX_COMPILER clang++)
SET(COMMON_FLAGS "-std=c++14 -DWXUSINGDLL -DSTATIC_WXC -DCALLINGCONV=__attribute__((swiftcall)) -O2 -Wno-ignored-attributes -Wno-macro-redefined -D__GXX_ABI_VERSION=1008")

# Compile Flags
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_FLAGS}")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_FLAGS}")

include_directories(
    "${WXWIDGETS_DIR}/lib/gcc510TDM_x64_dll/mswu"
    "${WXWIDGETS_DIR}/include"
     ${PROJECT_SOURCE_DIR}/include
    )

# Set Output Directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Subdirectories
add_subdirectory(cpp)
