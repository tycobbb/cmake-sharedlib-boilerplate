# project
cmake_minimum_required(VERSION 2.8.9)
project(hello)

# libraries
set(LIBRARIES libhello.so)
link_directories(../build/dev)

# includes
include_directories(./)
include_directories(../lib)

# sources
# - glob .cpp files into $SOURCES
file(GLOB_RECURSE SOURCES "./*.cpp")

# targets
add_executable(hello ${SOURCES})
target_link_libraries(hello ${LIBRARIES})
