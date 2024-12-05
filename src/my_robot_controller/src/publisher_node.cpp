#include "ros/ros.h"
#include "std_msgs/String.h"
#include "vesc_hw_interface/vesc_wheel_controller.h"

int main(int argc, char **argv){

    ros::init(argc,argv,"Publisher");
    ros::NodeHandle nh;
    ros::Publisher topic_pub = nh.advertise<std_msgs::String>("world", 1000);
    ros::Rate loop_rate(1);
    //vesc_hw_interface::init();
    while(ros::ok()){

        std_msgs::String msg;
        topic_pub.publish(msg);
        ros::spinOnce();
        loop_rate.sleep();

    }
    return 0;
}