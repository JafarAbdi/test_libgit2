cmake_minimum_required(VERSION 3.16)
project(test_libgit2)

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
find_package(libgit2 REQUIRED)

add_executable(test_libgit2 main.cpp)
target_link_libraries(test_libgit2 PRIVATE git2::git2)
