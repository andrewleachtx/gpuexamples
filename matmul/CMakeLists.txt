cmake_minimum_required(VERSION 3.16...3.31)

project(MATMUL
        LANGUAGES CUDA CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CUDA_ARCHITECTURES 86)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_SEPARABLE_COMPILATION ON)
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} --generate-line-info --expt-relaxed-constexpr")
# troublesome Eigen stuff, ideally just remove from the main entry point but w/e
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -diag-suppress=20012")

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
else()
    message(STATUS "Feel free to sudo apt install ccache if you want faster compilation times.")
endif()

add_executable(matmul src/matmul.cu)

if (MSVC)
    target_compile_options(matmul PRIVATE /W4 /WX)
else()
    target_compile_options(matmul PRIVATE $<$<COMPILE_LANGUAGE:CXX>:-Wall -Wextra -pedantic -Werror>)
endif()

# set_target_properties(matmul)

# target_link_libraries(matmul PRIVATE)

# target_include_directories(matmul PRIVATE)