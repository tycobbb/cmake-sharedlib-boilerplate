# project
cmake_minimum_required(VERSION 2.8.9)
project(hello)

# includes
include_directories(./)

# sources
# - glob .cpp files into $SOURCES
file(GLOB_RECURSE SOURCES "./*.cpp")

# targets
add_library(hello SHARED ${SOURCES})
