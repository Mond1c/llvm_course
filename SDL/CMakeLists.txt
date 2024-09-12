cmake_minimum_required(VERSION 3.20)
project(SDL)

set(CMAKE_C_STANDARD 11)

find_package(SDL2 REQUIRED)

add_executable(app sim.c app.c start.c)

target_link_libraries(app PRIVATE SDL2::SDL2)