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


if(visualization_marker_tutorials_CONFIG_INCLUDED)
  return()
endif()
set(visualization_marker_tutorials_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(visualization_marker_tutorials_SOURCE_PREFIX /home/f1tenthteam2/pleasework/src/visualization_tutorials/visualization_marker_tutorials)
  set(visualization_marker_tutorials_DEVEL_PREFIX /home/f1tenthteam2/pleasework/devel_isolated/visualization_marker_tutorials)
  set(visualization_marker_tutorials_INSTALL_PREFIX "")
  set(visualization_marker_tutorials_PREFIX ${visualization_marker_tutorials_DEVEL_PREFIX})
else()
  set(visualization_marker_tutorials_SOURCE_PREFIX "")
  set(visualization_marker_tutorials_DEVEL_PREFIX "")
  set(visualization_marker_tutorials_INSTALL_PREFIX /home/f1tenthteam2/pleasework/install_isolated)
  set(visualization_marker_tutorials_PREFIX ${visualization_marker_tutorials_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'visualization_marker_tutorials' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(visualization_marker_tutorials_FOUND_CATKIN_PROJECT TRUE)

if(NOT " " STREQUAL " ")
  set(visualization_marker_tutorials_INCLUDE_DIRS "")
  set(_include_dirs "")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://ros.org/wiki/visualization_marker_tutorials " STREQUAL " ")
    set(_report "Check the website 'http://ros.org/wiki/visualization_marker_tutorials' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'William Woodall <william@osrfoundation.org>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${visualization_marker_tutorials_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'visualization_marker_tutorials' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'visualization_marker_tutorials' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(visualization_marker_tutorials_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND visualization_marker_tutorials_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND visualization_marker_tutorials_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT visualization_marker_tutorials_NUM_DUMMY_TARGETS)
      set(visualization_marker_tutorials_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::visualization_marker_tutorials::wrapped-linker-option${visualization_marker_tutorials_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR visualization_marker_tutorials_NUM_DUMMY_TARGETS "${visualization_marker_tutorials_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::visualization_marker_tutorials::wrapped-linker-option${visualization_marker_tutorials_NUM_DUMMY_TARGETS}")
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
    list(APPEND visualization_marker_tutorials_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND visualization_marker_tutorials_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND visualization_marker_tutorials_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/f1tenthteam2/pleasework/install_isolated/lib;/home/f1tenthteam2/pleasework/devel_isolated/ackermann_cmd_mux/lib;/home/f1tenthteam2/pleasework/devel_isolated/racecar/lib;/home/f1tenthteam2/pleasework/devel_isolated/xacro/lib;/home/f1tenthteam2/pleasework/devel_isolated/wiimote/lib;/home/f1tenthteam2/pleasework/devel_isolated/move_base/lib;/home/f1tenthteam2/pleasework/devel_isolated/rotate_recovery/lib;/home/f1tenthteam2/pleasework/devel_isolated/global_planner/lib;/home/f1tenthteam2/pleasework/devel_isolated/navfn/lib;/home/f1tenthteam2/pleasework/devel_isolated/move_slow_and_clear/lib;/home/f1tenthteam2/pleasework/devel_isolated/dwa_local_planner/lib;/home/f1tenthteam2/pleasework/devel_isolated/clear_costmap_recovery/lib;/home/f1tenthteam2/pleasework/devel_isolated/carrot_planner/lib;/home/f1tenthteam2/pleasework/devel_isolated/base_local_planner/lib;/home/f1tenthteam2/pleasework/devel_isolated/nav_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/costmap_2d/lib;/home/f1tenthteam2/pleasework/devel_isolated/voxel_grid/lib;/home/f1tenthteam2/pleasework/devel_isolated/visualization_marker_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/vesc_driver/lib;/home/f1tenthteam2/pleasework/devel_isolated/vesc_ackermann/lib;/home/f1tenthteam2/pleasework/devel_isolated/urg_node/lib;/home/f1tenthteam2/pleasework/devel_isolated/urdf_tutorial/lib;/home/f1tenthteam2/pleasework/devel_isolated/rviz_python_tutorial/lib;/home/f1tenthteam2/pleasework/devel_isolated/rviz_plugin_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_rviz/lib;/home/f1tenthteam2/pleasework/devel_isolated/librviz_tutorial/lib;/home/f1tenthteam2/pleasework/devel_isolated/rviz/lib;/home/f1tenthteam2/pleasework/devel_isolated/robot_state_publisher/lib;/home/f1tenthteam2/pleasework/devel_isolated/kdl_parser/lib;/home/f1tenthteam2/pleasework/devel_isolated/joint_limits_interface/lib;/home/f1tenthteam2/pleasework/devel_isolated/urdf/lib;/home/f1tenthteam2/pleasework/devel_isolated/turtle_tf2/lib;/home/f1tenthteam2/pleasework/devel_isolated/turtle_tf/lib;/home/f1tenthteam2/pleasework/devel_isolated/turtle_actionlib/lib;/home/f1tenthteam2/pleasework/devel_isolated/turtlesim/lib;/home/f1tenthteam2/pleasework/devel_isolated/transmission_interface/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf_conversions/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_sensor_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_kdl/lib;/home/f1tenthteam2/pleasework/devel_isolated/laser_geometry/lib;/home/f1tenthteam2/pleasework/devel_isolated/interactive_marker_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/f1tenth_simulator/lib;/home/f1tenthteam2/pleasework/devel_isolated/interactive_markers/lib;/home/f1tenthteam2/pleasework/devel_isolated/fake_localization/lib;/home/f1tenthteam2/pleasework/devel_isolated/amcl/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_geometry_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_ros/lib;/home/f1tenthteam2/pleasework/devel_isolated/stereo_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/spacenav_node/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_image_view/lib;/home/f1tenthteam2/pleasework/devel_isolated/map_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/laser_proc/lib;/home/f1tenthteam2/pleasework/devel_isolated/joy/lib;/home/f1tenthteam2/pleasework/devel_isolated/image_transport/lib;/home/f1tenthteam2/pleasework/devel_isolated/cv_bridge/lib;/home/f1tenthteam2/pleasework/devel_isolated/sensor_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_launch/lib;/home/f1tenthteam2/pleasework/devel_isolated/roswtf/lib;/home/f1tenthteam2/pleasework/devel_isolated/nodelet_topic_tools/lib;/home/f1tenthteam2/pleasework/devel_isolated/driver_base/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_analysis/lib;/home/f1tenthteam2/pleasework/devel_isolated/combined_robot_hw_tests/lib;/home/f1tenthteam2/pleasework/devel_isolated/controller_manager_tests/lib;/home/f1tenthteam2/pleasework/devel_isolated/controller_manager/lib;/home/f1tenthteam2/pleasework/devel_isolated/actionlib_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/actionlib/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbag/lib;/home/f1tenthteam2/pleasework/devel_isolated/topic_tools/lib;/home/f1tenthteam2/pleasework/devel_isolated/timestamp_tools/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_py/lib;/home/f1tenthteam2/pleasework/devel_isolated/smach_ros/lib;/home/f1tenthteam2/pleasework/devel_isolated/self_test/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_reconfigure/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_gui_py/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_gui_cpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/rostopic/lib;/home/f1tenthteam2/pleasework/devel_isolated/rospy_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosnode/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosmsg/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbag_storage/lib;/home/f1tenthteam2/pleasework/devel_isolated/message_filters/lib;/home/f1tenthteam2/pleasework/devel_isolated/map_server/lib;/home/f1tenthteam2/pleasework/devel_isolated/joint_state_publisher/lib;/home/f1tenthteam2/pleasework/devel_isolated/filters/lib;/home/f1tenthteam2/pleasework/devel_isolated/dynamic_reconfigure/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_common_diagnostics/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_updater/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_aggregator/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosout/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/pluginlib_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/nodelet_tutorial_math/lib;/home/f1tenthteam2/pleasework/devel_isolated/nodelet/lib;/home/f1tenthteam2/pleasework/devel_isolated/my_robot_controller/lib;/home/f1tenthteam2/pleasework/devel_isolated/controller_interface/lib;/home/f1tenthteam2/pleasework/devel_isolated/combined_robot_hw/lib;/home/f1tenthteam2/pleasework/devel_isolated/hardware_interface/lib;/home/f1tenthteam2/pleasework/devel_isolated/bondpy/lib;/home/f1tenthteam2/pleasework/devel_isolated/bondcpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/xmlrpcpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/webkit_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/viz/lib;/home/f1tenthteam2/pleasework/devel_isolated/visualization_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/visualization_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/vesc_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/vesc/lib;/home/f1tenthteam2/pleasework/devel_isolated/urg_c/lib;/home/f1tenthteam2/pleasework/devel_isolated/urdf_parser_plugin/lib;/home/f1tenthteam2/pleasework/devel_isolated/control_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/trajectory_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2/lib;/home/f1tenthteam2/pleasework/devel_isolated/tf2_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/std_srvs/lib;/home/f1tenthteam2/pleasework/devel_isolated/smach_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/shape_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_py_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosgraph_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/nav_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/move_base_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/kdl_conversions/lib;/home/f1tenthteam2/pleasework/devel_isolated/eigen_conversions/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostic_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/controller_manager_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/bond/lib;/home/f1tenthteam2/pleasework/devel_isolated/actionlib_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/ackermann_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/std_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/smclib/lib;/home/f1tenthteam2/pleasework/devel_isolated/smach/lib;/home/f1tenthteam2/pleasework/devel_isolated/serial/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_web/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_topic/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_top/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_tf_tree/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_srv/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_shell/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_service_caller/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_runtime_monitor/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_steering/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_monitor/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_robot_dashboard/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_py_console/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_publisher/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_pose_view/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_plot/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_nav_view/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_msg/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_moveit/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_logger_level/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_graph/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_dep/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_controller_manager/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_console/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_common_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_bag_plugins/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_bag/lib;/home/f1tenthteam2/pleasework/devel_isolated/rqt_action/lib;/home/f1tenthteam2/pleasework/devel_isolated/rostest/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslz4/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosconsole_bridge/lib;/home/f1tenthteam2/pleasework/devel_isolated/resource_retriever/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui_cpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/pluginlib/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosconsole/lib;/home/f1tenthteam2/pleasework/devel_isolated/angles/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosunit/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslaunch/lib;/home/f1tenthteam2/pleasework/devel_isolated/python_qt_binding/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_serialization/lib;/home/f1tenthteam2/pleasework/devel_isolated/rostime/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosservice/lib;/home/f1tenthteam2/pleasework/devel_isolated/rospy/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosparam/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslib/lib;/home/f1tenthteam2/pleasework/devel_isolated/rospack/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosmaster/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosmake/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslisp/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslint/lib;/home/f1tenthteam2/pleasework/devel_isolated/roslang/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosgraph/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscreate/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_traits/lib;/home/f1tenthteam2/pleasework/devel_isolated/roscpp_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosclean/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbuild/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosboost_cfg/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbash/lib;/home/f1tenthteam2/pleasework/devel_isolated/rosbag_migration_rule/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_environment/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_control/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_comm/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros_base/lib;/home/f1tenthteam2/pleasework/devel_isolated/ros/lib;/home/f1tenthteam2/pleasework/devel_isolated/robot/lib;/home/f1tenthteam2/pleasework/devel_isolated/qwt_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui_py_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/qt_dotgraph/lib;/home/f1tenthteam2/pleasework/devel_isolated/nodelet_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/navigation/lib;/home/f1tenthteam2/pleasework/devel_isolated/mk/lib;/home/f1tenthteam2/pleasework/devel_isolated/message_runtime/lib;/home/f1tenthteam2/pleasework/devel_isolated/message_generation/lib;/home/f1tenthteam2/pleasework/devel_isolated/media_export/lib;/home/f1tenthteam2/pleasework/devel_isolated/joystick_drivers/lib;/home/f1tenthteam2/pleasework/devel_isolated/joint_state_publisher_gui/lib;/home/f1tenthteam2/pleasework/devel_isolated/gl_dependency/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/geometry/lib;/home/f1tenthteam2/pleasework/devel_isolated/executive_smach/lib;/home/f1tenthteam2/pleasework/devel_isolated/driver_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/diagnostics/lib;/home/f1tenthteam2/pleasework/devel_isolated/desktop/lib;/home/f1tenthteam2/pleasework/devel_isolated/cpp_common/lib;/home/f1tenthteam2/pleasework/devel_isolated/common_tutorials/lib;/home/f1tenthteam2/pleasework/devel_isolated/common_msgs/lib;/home/f1tenthteam2/pleasework/devel_isolated/class_loader/lib;/home/f1tenthteam2/pleasework/devel_isolated/cmake_modules/lib;/home/f1tenthteam2/pleasework/devel_isolated/bond_core/lib;/home/f1tenthteam2/pleasework/devel_isolated/genpy/lib;/home/f1tenthteam2/pleasework/devel_isolated/gennodejs/lib;/home/f1tenthteam2/pleasework/devel_isolated/genlisp/lib;/home/f1tenthteam2/pleasework/devel_isolated/geneus/lib;/home/f1tenthteam2/pleasework/devel_isolated/gencpp/lib;/home/f1tenthteam2/pleasework/devel_isolated/genmsg/lib;/home/f1tenthteam2/pleasework/devel_isolated/catkin/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(visualization_marker_tutorials_LIBRARY_DIRS ${lib_path})
      list(APPEND visualization_marker_tutorials_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'visualization_marker_tutorials'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND visualization_marker_tutorials_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(visualization_marker_tutorials_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${visualization_marker_tutorials_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "roscpp;visualization_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 visualization_marker_tutorials_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${visualization_marker_tutorials_dep}_FOUND)
      find_package(${visualization_marker_tutorials_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${visualization_marker_tutorials_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(visualization_marker_tutorials_INCLUDE_DIRS ${${visualization_marker_tutorials_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(visualization_marker_tutorials_LIBRARIES ${visualization_marker_tutorials_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${visualization_marker_tutorials_dep}_LIBRARIES})
  _list_append_deduplicate(visualization_marker_tutorials_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(visualization_marker_tutorials_LIBRARIES ${visualization_marker_tutorials_LIBRARIES})

  _list_append_unique(visualization_marker_tutorials_LIBRARY_DIRS ${${visualization_marker_tutorials_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(visualization_marker_tutorials_EXPORTED_TARGETS ${${visualization_marker_tutorials_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${visualization_marker_tutorials_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
