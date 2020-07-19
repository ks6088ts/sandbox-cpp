cmake_minimum_required(VERSION 3.5)

# Set the project name
project (hello_gtest)


# find GTest
# /usr/share/cmake-3.16/Modules/FindGTest.cmake
find_package(GTest REQUIRED)

# check if GTest was found
if(GTest_FOUND)
    message ("GTest found")
else()
    message (FATAL_ERROR "Cannot find GTest")
endif()

# find Threads
# /usr/share/cmake-3.16/Modules/FindThreads.cmake
find_package(Threads REQUIRED)

# check if Threads was found
if(Threads_FOUND)
    message ("Threads found")
else()
    message (FATAL_ERROR "Cannot find Threads")
endif()


# Add an executable
add_executable(hello_gtest main.cpp)

# link against the boost libraries
target_link_libraries(hello_gtest
    PRIVATE
        ${GTEST_LIBRARIES}
        ${GTEST_MAIN_LIBRARIES}
        Threads::Threads
)
