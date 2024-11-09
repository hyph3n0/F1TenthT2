# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/urdf_tutorial
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/urdf_tutorial
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_urdf_tutorial_roslaunch-check_launch "/home/f1tenthteam2/pleasework/build_isolated/urdf_tutorial/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/urdf_tutorial/test_results/urdf_tutorial/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/f1tenthteam2/pleasework/build_isolated/urdf_tutorial/test_results/urdf_tutorial" "/home/f1tenthteam2/pleasework/src/ros_comm/roslaunch/scripts/roslaunch-check -o \"/home/f1tenthteam2/pleasework/build_isolated/urdf_tutorial/test_results/urdf_tutorial/roslaunch-check_launch.xml\" \"/home/f1tenthteam2/pleasework/src/urdf_tutorial/launch\" ")
set_tests_properties(_ctest_urdf_tutorial_roslaunch-check_launch PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/devel_isolated/roslaunch/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/urdf_tutorial/CMakeLists.txt;9;roslaunch_add_file_check;/home/f1tenthteam2/pleasework/src/urdf_tutorial/CMakeLists.txt;0;")
subdirs("gtest")
