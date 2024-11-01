# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/ros_comm/roslaunch
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/roslaunch
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roslaunch_nosetests_test.unit "/home/f1tenthteam2/pleasework/build_isolated/roslaunch/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/roslaunch/test_results/roslaunch/nosetests-test.unit.xml" "--return-code" "\"/usr/bin/cmake\" -E make_directory /home/f1tenthteam2/pleasework/build_isolated/roslaunch/test_results/roslaunch" "/usr/bin/nosetests3 -P --process-timeout=60 --where=/home/f1tenthteam2/pleasework/src/ros_comm/roslaunch/test/unit --with-xunit --xunit-file=/home/f1tenthteam2/pleasework/build_isolated/roslaunch/test_results/roslaunch/nosetests-test.unit.xml")
set_tests_properties(_ctest_roslaunch_nosetests_test.unit PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/nosetests.cmake;83;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/ros_comm/roslaunch/CMakeLists.txt;26;catkin_add_nosetests;/home/f1tenthteam2/pleasework/src/ros_comm/roslaunch/CMakeLists.txt;0;")
subdirs("gtest")
