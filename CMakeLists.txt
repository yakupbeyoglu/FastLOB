cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME "FastLob")

project(${PROJECT_NAME} CXX)

# --------------------------
# C++ Standard
# --------------------------
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --------------------------
# Include headers
# --------------------------
include_directories(include)

# --------------------------
# Sanitizer options
# --------------------------
option(USE_TSAN "Enable ThreadSanitizer" OFF)
option(USE_ASAN "Enable AddressSanitizer" OFF)

if(USE_TSAN)
    set(TSAN_FLAGS "-fsanitize=thread" "-g")
    add_compile_options(${TSAN_FLAGS})
    add_link_options(${TSAN_FLAGS})
elseif(USE_ASAN)
    set(ASAN_FLAGS "-fsanitize=address" "-fno-omit-frame-pointer" "-g")
    add_compile_options(${ASAN_FLAGS})
    add_link_options(${ASAN_FLAGS})
endif()

# --------------------------
# Fetch spdlog into third_party/
# --------------------------
include(FetchContent)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.15.3
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/third_party/spdlog
)

FetchContent_MakeAvailable(spdlog)

# --------------------------
# Main executable
# --------------------------
add_executable(${PROJECT_NAME} main.cpp)

if(NOT MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -pedantic -pthread)
endif()

# Link spdlog header-only target
target_link_libraries(${PROJECT_NAME} PRIVATE spdlog::spdlog_header_only)

# --------------------------
# Output location: build/bin
# --------------------------
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# --------------------------
# Tests
# --------------------------
enable_testing()
add_subdirectory(test)
