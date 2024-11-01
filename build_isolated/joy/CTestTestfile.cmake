# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/joystick_drivers/joy
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/joy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_joy_roslint_package "/home/f1tenthteam2/pleasework/build_isolated/joy/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/joy/test_results/joy/roslint-joy.xml" "--working-dir" "/home/f1tenthteam2/pleasework/build_isolated/joy" "--return-code" "/home/f1tenthteam2/pleasework/src/roslint/scripts/test_wrapper /home/f1tenthteam2/pleasework/build_isolated/joy/test_results/joy/roslint-joy.xml make roslint_joy")
set_tests_properties(_ctest_joy_roslint_package PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/devel_isolated/roslint/share/roslint/cmake/roslint-extras.cmake;67;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/joystick_drivers/joy/CMakeLists.txt;17;roslint_add_test;/home/f1tenthteam2/pleasework/src/joystick_drivers/joy/CMakeLists.txt;0;")
subdirs("gtest")
