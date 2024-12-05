# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/ros_control/controller_interface
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/controller_interface
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_controller_interface_gtest_controller_base_test "/home/f1tenthteam2/pleasework/build_isolated/controller_interface/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/controller_interface/test_results/controller_interface/gtest-controller_base_test.xml" "--return-code" "/home/f1tenthteam2/pleasework/devel_isolated/controller_interface/lib/controller_interface/controller_base_test --gtest_output=xml:/home/f1tenthteam2/pleasework/build_isolated/controller_interface/test_results/controller_interface/gtest-controller_base_test.xml")
set_tests_properties(_ctest_controller_interface_gtest_controller_base_test PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/gtest.cmake;63;_catkin_add_google_test;/home/f1tenthteam2/pleasework/src/ros_control/controller_interface/CMakeLists.txt;33;catkin_add_gmock;/home/f1tenthteam2/pleasework/src/ros_control/controller_interface/CMakeLists.txt;0;")
subdirs("gtest")
