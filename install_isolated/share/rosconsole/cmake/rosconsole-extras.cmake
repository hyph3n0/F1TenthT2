# ros_comm/tools/rosconsole/cmake/rosconsole-extras.cmake

# force automatic escaping of preprocessor definitions
cmake_policy(PUSH)
cmake_policy(SET CMP0005 NEW)

# add ROS_PACKAGE_NAME define required by the named logging macros
add_definitions(-DROS_PACKAGE_NAME=\"${PROJECT_NAME}\")

if("log4cxx" STREQUAL "log4cxx")
  # add ROSCONSOLE_BACKEND_LOG4CXX define required for backward compatible log4cxx symbols
  add_definitions(-DROSCONSOLE_BACKEND_LOG4CXX)
endif()

cmake_policy(POP)

if("log4cxx" STREQUAL "log4cxx" AND "TRUE")
  if(NOT DEFINED CMAKE_CXX_STANDARD OR "${CMAKE_CXX_STANDARD}" LESS 17)
    message(STATUS "rosconsole is upgrading C++ standard to C++17")
    set(CMAKE_CXX_STANDARD 17)
  endif()
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()
