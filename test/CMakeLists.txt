# project
cmake_minimum_required(VERSION 2.8.9)
project(hello_test)

# includes
include_directories(../src)

# sources
# - glob .cpp files into $SOURCES
file(GLOB_RECURSE SOURCES "../src/*.cpp")

# binaries
add_executable(hello_test ${SOURCES})
