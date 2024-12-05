# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(gencpp_CONFIG_INCLUDED)
  return()
endif()
set(gencpp_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(gencpp_SOURCE_PREFIX /home/f1tenthteam2/pleasework/src/gencpp)
  set(gencpp_DEVEL_PREFIX /home/f1tenthteam2/pleasework/devel_isolated/gencpp)
  set(gencpp_INSTALL_PREFIX "")
  set(gencpp_PREFIX ${gencpp_DEVEL_PREFIX})
else()
  set(gencpp_SOURCE_PREFIX "")
  set(gencpp_DEVEL_PREFIX "")
  set(gencpp_INSTALL_PREFIX /home/f1tenthteam2/pleasework/install_isolated)
  set(gencpp_PREFIX ${gencpp_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'gencpp' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(gencpp_FOUND_CATKIN_PROJECT TRUE)

if(NOT " " STREQUAL " ")
  set(gencpp_INCLUDE_DIRS "")
  set(_include_dirs "")
  if(NOT "https://github.com/ros/gencpp/issues " STREQUAL " ")
    set(_report "Check the issue tracker 'https://github.com/ros/gencpp/issues' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT " " STREQUAL " ")
    set(_report "Check the website '' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Dirk Thomas <dthomas@osrfoundation.org>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${gencpp_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'gencpp' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'gencpp' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/f1tenthteam2/pleasework/src/gencpp/${idir}'.  ${_report}")
    endif()
    _list_append_unique(gencpp_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND gencpp_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND gencpp_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT gencpp_NUM_DUMMY_TARGETS)
      set(gencpp_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::gencpp::wrapped-linker-option${gencpp_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR gencpp_NUM_DUMMY_TARGETS "${gencpp_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::gencpp::wrapped-linker-option${gencpp_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND gencpp_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND gencpp_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND gencpp_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/f1tenthteam2/pleasework/devel_isolated/gencpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/bondpy/lib;/home/f1tenthteam2/pleasework/devel_isolated/bondcpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/xmlrpcpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/webkit_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/viz/lib;/home/f1tenthteam2/pleasework/devel_isolated/visualization_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/visualization_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/urdf_parser_plugin/lib;/home/f1tenthteam2/pleasework/devel_isolated/control_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/trajectory_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/std_srvs/lib;/home/f1tenthteam2/pleasework/devel_isolated/smach_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/shape_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_py_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosgraph_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/nav_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/move_base_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/kdl_conversions/lib;/home/f1tenthteam2/pleasework/devel_isolated/eigen_conversions/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/bond/lib;/home/f1tenthteam2/pleasework/devel_isolated/actionlib_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/ackermann_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/std_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/smclib/lib;/home/f1tenthteam2/pleasework/devel_isolated/smach/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_web/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_topic/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_top/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_tf_tree/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_srv/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_shell/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_service_caller/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_runtime_monitor/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_steering/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_monitor/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_dashboard/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_py_console/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_publisher/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_pose_view/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_plot/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_nav_view/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_msg/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_moveit/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_logger_level/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_graph/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_dep/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_console/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_common_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_bag_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_bag/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_action/lib;/home/f1tenthteam2/pleasework/devel_isolated/rostest/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslz4/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosconsole_bridge/lib;/home/f1tenthteam2/pleasework/devel_isolated/resource_retriever/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui_cpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/pluginlib/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosconsole/lib;/home/f1tenthteam2/pleasework/devel_isolated/angles/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosunit/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslaunch/lib;/home/f1tenthteam2/pleasework/devel_isolated/python_qt_binding/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_serialization/lib;/home/f1tenthteam2/pleasework/devel_isolated/rostime/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosservice/lib;/home/f1tenthteam2/pleasework/devel_isolated/rospy/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosparam/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslib/lib;/home/f1tenthteam2/pleasework/devel_isolated/rospack/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosmaster/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosmake/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslisp/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslint/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslang/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosgraph/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscreate/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_traits/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosclean/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbuild/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosboost_cfg/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbash/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbag_migration_rule/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_environment/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_comm/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_base/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros/lib;/home/f1tenthteam2/pleasework/devel_isolated/robot/lib;/home/f1tenthteam2/pleasework/devel_isolated/qwt_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui_py_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_dotgraph/lib;/home/f1tenthteam2/pleasework/devel_isolated/nodelet_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/navigation/lib;/home/f1tenthteam2/pleasework/devel_isolated/mk/lib;/home/f1tenthteam2/pleasework/devel_isolated/message_runtime/lib;/home/f1tenthteam2/pleasework/devel_isolated/message_generation/lib;/home/f1tenthteam2/pleasework/devel_isolated/media_export/lib;/home/f1tenthteam2/pleasework/devel_isolated/joystick_drivers/lib;/home/f1tenthteam2/pleasework/devel_isolated/joint_state_publisher_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/gl_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry/lib;/home/f1tenthteam2/pleasework/devel_isolated/executive_smach/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostics/lib;/home/f1tenthteam2/pleasework/devel_isolated/desktop/lib;/home/f1tenthteam2/pleasework/devel_isolated/cpp_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/common_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/common_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/class_loader/lib;/home/f1tenthteam2/pleasework/devel_isolated/cmake_modules/lib;/home/f1tenthteam2/pleasework/devel_isolated/bond_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/genpy/lib;/home/f1tenthteam2/pleasework/devel_isolated/gennodejs/lib;/home/f1tenthteam2/pleasework/devel_isolated/genlisp/lib;/home/f1tenthteam2/pleasework/devel_isolated/geneus/lib;/home/f1tenthteam2/pleasework/devel_isolated/gencpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/genmsg/lib;/home/f1tenthteam2/pleasework/devel_isolated/catkin/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(gencpp_LIBRARY_DIRS ${lib_path})
      list(APPEND gencpp_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'gencpp'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND gencpp_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(gencpp_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${gencpp_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "genmsg")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 gencpp_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${gencpp_dep}_FOUND)
      find_package(${gencpp_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${gencpp_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(gencpp_INCLUDE_DIRS ${${gencpp_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(gencpp_LIBRARIES ${gencpp_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${gencpp_dep}_LIBRARIES})
  _list_append_deduplicate(gencpp_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(gencpp_LIBRARIES ${gencpp_LIBRARIES})

  _list_append_unique(gencpp_LIBRARY_DIRS ${${gencpp_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(gencpp_EXPORTED_TARGETS ${${gencpp_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "gencpp-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${gencpp_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
