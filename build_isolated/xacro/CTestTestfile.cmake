# CMake generated Testfile for 
# Source directory: /home/f1tenthteam2/pleasework/src/xacro
# Build directory: /home/f1tenthteam2/pleasework/build_isolated/xacro
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_xacro_nosetests_test "/home/f1tenthteam2/pleasework/build_isolated/xacro/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/run_tests.py" "/home/f1tenthteam2/pleasework/build_isolated/xacro/test_results/xacro/nosetests-test.xml" "--return-code" "\"/usr/bin/cmake\" -E make_directory /home/f1tenthteam2/pleasework/build_isolated/xacro/test_results/xacro" "/usr/bin/nosetests3 -P --process-timeout=60 --where=/home/f1tenthteam2/pleasework/src/xacro/test --with-xunit --xunit-file=/home/f1tenthteam2/pleasework/build_isolated/xacro/test_results/xacro/nosetests-test.xml")
set_tests_properties(_ctest_xacro_nosetests_test PROPERTIES  _BACKTRACE_TRIPLES "/home/f1tenthteam2/pleasework/src/catkin/cmake/test/tests.cmake;160;add_test;/home/f1tenthteam2/pleasework/src/catkin/cmake/test/nosetests.cmake;83;catkin_run_tests_target;/home/f1tenthteam2/pleasework/src/xacro/CMakeLists.txt;20;catkin_add_nosetests;/home/f1tenthteam2/pleasework/src/xacro/CMakeLists.txt;0;")
subdirs("gtest")
subdirs("test")
