cmake_minimum_required(VERSION 3.20)
set(CMAKE_C_COMPILER /usr/bin/clang)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
project(llvm_course)


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 20)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_DIR}")
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})


set(SOURCE_FILES SDL/app.c)

add_executable(app_normal ${SOURCE_FILES} SDL/sim.c SDL/start.c)

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})
target_link_libraries(app_normal ${SDL2_LIBRARIES})
set(PASS_PLUGIN_PATH "${CMAKE_BINARY_DIR}/libPass.so")

add_custom_command(
    OUTPUT ${PASS_PLUGIN_PATH}
    COMMAND ${CMAKE_CXX_COMPILER}
    ARGS -shared -fPIC -o ${PASS_PLUGIN_PATH} ${CMAKE_SOURCE_DIR}/llvm_pass/llvm_pass.cpp
    -I${LLVM_INCLUDE_DIRS} 
    DEPENDS ${CMAKE_SOURCE_DIR}/llvm_pass/llvm_pass.cpp
    COMMENT "Building LLVM Pass as shared library"
)

add_custom_command(
    OUTPUT app_with_pass
    COMMAND ${CMAKE_C_COMPILER}
    ARGS -fpass-plugin=${PASS_PLUGIN_PATH} -O2 ${CMAKE_SOURCE_DIR}/SDL/app.c -o ${CMAKE_BINARY_DIR}/app_with_pass
    DEPENDS ${SOURCE_FILES} ${PASS_PLUGIN_PATH}
    COMMENT "Building SDL app with LLVM pass"
)

# Custom target to trigger the build of the app with the pass
add_custom_target(build_with_pass ALL DEPENDS app_with_pass)

# Optionally: show a message after the build
add_custom_command(
    TARGET build_with_pass
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Run your app with the pass: ./app_with_pass"
    COMMENT "Finished building app with LLVM pass plugin"
)
