# Install script for directory: /home/f1tenthteam2/pleasework/src/rviz/src/rviz/default_plugin

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/f1tenthteam2/pleasework/install_isolated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/rviz/default_plugin" TYPE FILE FILES "/home/f1tenthteam2/pleasework/devel_isolated/rviz/include/rviz/default_plugin/rviz_default_plugin_export.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/f1tenthteam2/pleasework/devel_isolated/rviz/lib/librviz_default_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so"
         OLD_RPATH "/home/f1tenthteam2/pleasework/devel_isolated/rviz/lib:/home/f1tenthteam2/pleasework/devel_isolated/image_transport/lib:/home/f1tenthteam2/pleasework/devel_isolated/interactive_markers/lib:/home/f1tenthteam2/pleasework/devel_isolated/laser_geometry/lib:/home/f1tenthteam2/pleasework/devel_isolated/tf/lib:/home/f1tenthteam2/pleasework/devel_isolated/resource_retriever/lib:/usr/local/lib:/home/f1tenthteam2/pleasework/devel_isolated/tf2_ros/lib:/home/f1tenthteam2/pleasework/devel_isolated/actionlib/lib:/home/f1tenthteam2/pleasework/devel_isolated/message_filters/lib:/home/f1tenthteam2/pleasework/devel_isolated/tf2/lib:/home/f1tenthteam2/pleasework/devel_isolated/urdf/lib:/home/f1tenthteam2/pleasework/devel_isolated/class_loader/lib:/home/f1tenthteam2/pleasework/devel_isolated/roslib/lib:/home/f1tenthteam2/pleasework/devel_isolated/rospack/lib:/home/f1tenthteam2/pleasework/devel_isolated/rosconsole_bridge/lib:/home/f1tenthteam2/pleasework/devel_isolated/roscpp/lib:/home/f1tenthteam2/pleasework/devel_isolated/rosconsole/lib:/home/f1tenthteam2/pleasework/devel_isolated/xmlrpcpp/lib:/home/f1tenthteam2/pleasework/devel_isolated/roscpp_serialization/lib:/home/f1tenthteam2/pleasework/devel_isolated/rostime/lib:/home/f1tenthteam2/pleasework/devel_isolated/cpp_common/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/librviz_default_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rviz/cmake" TYPE FILE FILES "/home/f1tenthteam2/pleasework/devel_isolated/rviz/share/rviz/cmake/default_plugin_location.cmake")
endif()

