cmake_minimum_required(VERSION 3.20)
project(SDL)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_C_STANDARD 11)

find_package(SDL2 REQUIRED)

set(SOLUTION_FILE app.c)
get_filename_component(SOURCE_DIR ${CMAKE_SOURCE_DIR}/${SOLUTION_FILE} DIRECTORY)

add_custom_command(
    OUTPUT ${SOURCE_DIR}/${SOLUTION_FILE}.ll
    COMMAND ${CMAKE_C_COMPILER} -emit-llvm -S -O2 ${CMAKE_SOURCE_DIR}/${SOLUTION_FILE} -o ${SOURCE_DIR}/app.ll
    DEPENDS ${SOLUTION_FILE}
    COMMENT "Generating LLVM IR for ${SOLUTION_FILE} in ${SOURCE_DIR}"
)

add_custom_target(generate-llvm-ir ALL DEPENDS ${SOURCE_DIR}/${SOLUTION_FILE}.ll)

add_executable(app sim.c ${SOLUTION_FILE} start.c)

target_link_libraries(app PRIVATE SDL2::SDL2)
