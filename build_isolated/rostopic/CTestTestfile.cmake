# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/ros_comm/rostopic
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/rostopic
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rostopic_rostest_test_rostopic.test "/home/f1tenthteam2/pleasework/build_isolated/rostopic/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/rostopic/test_results/rostopic/rostest-test_rostopic.xml" "--return-code" "/usr/bin/python3 /home/f1tenthteam2/pleasework/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/f1tenthteam2/pleasework/src/ros_comm/rostopic --package=rostopic --results-filename test_rostopic.xml --results-base-dir \"/home/f1tenthteam2/pleasework/build_isolated/rostopic/test_results\" /home/f1tenthteam2/pleasework/src/ros_comm/rostopic/test/rostopic.test ")
set_tests_properties(_ctest_rostopic_rostest_test_rostopic.test PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/devel_isolated/rostest/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/ros_comm/rostopic/CMakeLists.txt;13;add_rostest;/home/f1tenthteam2/pleasework/src/ros_comm/rostopic/CMakeLists.txt;0;")
subdirs("gtest")
