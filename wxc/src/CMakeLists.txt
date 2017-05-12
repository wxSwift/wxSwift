cmake_minimum_required(VERSION 2.8.12)

SET(CMAKE_C_COMPILER clang)
SET(CMAKE_CXX_COMPILER clang++)
SET(COMMON_FLAGS "-std=c++14 -DWXUSINGDLL -DSTATIC_WXC -O2 -Wno-ignored-attributes -Wno-macro-redefined -D__GXX_ABI_VERSION=1008")

# For G++
#SET(CMAKE_C_COMPILER gcc)
#SET(CMAKE_CXX_COMPILER g++)
#SET(COMMON_FLAGS "-std=c++14 -DWXUSINGDLL -DSTATIC_WXC -O2 -D__GXX_ABI_VERSION=1008")

# Compile Flags
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_FLAGS}")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_FLAGS}")

# Enable Debug
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g" )
#SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g" )

include_directories(
    "C:/Work/wxWidgets-3.0.3/lib/gcc510TDM_x64_dll/mswu"
     ${PROJECT_SOURCE_DIR}/include
    "C:/Work/wxWidgets-3.0.3/include"
    )

# Set Output Directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Subdirectories
add_subdirectory(cpp)
