# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;serial;hardware_interface;joint_limits_interface;controller_manager;pluginlib;urdf;vesc_driver;angles".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lvesc_hw_interface".split(';') if "-lvesc_hw_interface" != "" else []
PROJECT_NAME = "vesc_hw_interface"
PROJECT_SPACE_DIR = "/home/f1tenthteam2/pleasework/install_isolated"
PROJECT_VERSION = "1.0.0"
