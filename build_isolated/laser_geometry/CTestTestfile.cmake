# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/laser_geometry
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/laser_geometry
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_laser_geometry_gtest_projection_test "/home/f1tenthteam2/pleasework/build_isolated/laser_geometry/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/laser_geometry/test_results/laser_geometry/gtest-projection_test.xml" "--return-code" "/home/f1tenthteam2/pleasework/devel_isolated/laser_geometry/lib/laser_geometry/projection_test --gtest_output=xml:/home/f1tenthteam2/pleasework/build_isolated/laser_geometry/test_results/laser_geometry/gtest-projection_test.xml")
set_tests_properties(_ctest_laser_geometry_gtest_projection_test PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/f1tenthteam2/pleasework/src/laser_geometry/CMakeLists.txt;44;catkin_add_gtest;/home/f1tenthteam2/pleasework/src/laser_geometry/CMakeLists.txt;0;")
subdirs("gtest")
