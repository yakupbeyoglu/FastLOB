include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
  DOWNLOAD_EXTRACT_TIMESTAMP ON
)

# For Windows/MSVC compatibility
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

# Define the test executable
add_executable(example_test example.cc)

# Link against GTest and the threading library
# EXAMPLE : target_link_libraries(ringbuffer_test GTest::gtest_main)
target_link_libraries(example_test GTest::gtest_main)
# Include the headers from the root
# EXAMPLE : target_include_directories(ringbuffer_test PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Add to the CTest framework
add_test(NAME example_test COMMAND example_test)