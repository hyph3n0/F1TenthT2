# Export the Qt version used by rviz.
set(rviz_QT_VERSION 5.15.3)

# Set the rviz_DEFAULT_PLUGIN_LIBRARIES variable.
# If the target exists, then this file was included during a cmake invocation
# that is shared with rviz's cmake, e.g. when building with catkin_make.
if(TARGET rviz_default_plugin)
  # So just set it to the target name.
  set(rviz_DEFAULT_PLUGIN_LIBRARIES rviz_default_plugin)
else()
  # Otherwise rviz was built separately and this was sourced from a devel space or install space.
  # If the location file doesn't exist at this point it is an error.
  if(EXISTS "${rviz_DIR}/default_plugin_location.cmake")
    # The file being included is generated by src/rviz/default_plugin/CMakeLists.txt
    include("${rviz_DIR}/default_plugin_location.cmake")
    set(rviz_DEFAULT_PLUGIN_LIBRARIES
      "${rviz_DIR}/../../../lib/${rviz_DEFAULT_PLUGIN_FILE_NAME}")
  else()
    message(FATAL_ERROR "the default_plugin_location.cmake file was not found and is required")
  endif()
endif()
