# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/roslint
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/roslint
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roslint_roslint_package "/home/f1tenthteam2/pleasework/build_isolated/roslint/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/roslint/test_results/roslint/roslint-roslint.xml" "--working-dir" "/home/f1tenthteam2/pleasework/build_isolated/roslint" "--return-code" "/home/f1tenthteam2/pleasework/src/roslint/scripts/test_wrapper /home/f1tenthteam2/pleasework/build_isolated/roslint/test_results/roslint/roslint-roslint.xml make roslint_roslint")
set_tests_properties(_ctest_roslint_roslint_package PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/build_isolated/roslint/cmake/roslint-extras.cmake;67;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/roslint/CMakeLists.txt;28;roslint_add_test;/home/f1tenthteam2/pleasework/src/roslint/CMakeLists.txt;0;")
subdirs("gtest")
