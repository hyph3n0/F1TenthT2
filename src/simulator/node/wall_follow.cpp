#include <ros/ros.h>
#include <ackermann_msgs/AckermannDriveStamped.h>
#include <ackermann_msgs/AckermannDrive.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>

// for printing
#include <iostream>

// for RAND_MAX
#include <cstdlib>

class wallfollow {
private:
    // A ROS node
    ros::NodeHandle n;

    // car parameters
    double max_speed, max_steering_angle;

    // Listen for odom messages
    ros::Subscriber laser_sub;

    // Publish drive data
    ros::Publisher drive_pub;

    // previous desired steering angle
    const double Kp = 1.0; // just fucking around with coefficients
    const double Ki = 0; // was 0.01
    const double Kd = 0; // was 1
    double prevError = 0.0;
    double integral = 0.0;
    double prev_angle = 0.0;
    double targetDistance = 0.6; // was 1 in simulation
    ackermann_msgs::AckermannDriveStamped drive_st_msg;
    ackermann_msgs::AckermannDrive drive_msg;

public:
    wallfollow() {
        // Initialize the node handle
        n = ros::NodeHandle("~");

        // get topic names
        std::string drive_topic, odom_topic, scan_topic;
        n.getParam("wall_drive_topic", drive_topic);
        n.getParam("odom_topic", odom_topic);
	    n.getParam("scan_topic", scan_topic);

        // get car parameters
        n.getParam("max_speed", max_speed);
        n.getParam("max_steering_angle", max_steering_angle);

        // Make a publisher for drive messages
        drive_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>(drive_topic, 10);

        // Start a subscriber to listen to odom messages
        //odom_sub = n.subscribe(odom_topic, 1, &wallfollow::odom_callback, this);
        laser_sub = n.subscribe(scan_topic, 1, &wallfollow::scan_callback, this);
	void scan_callback(const sensor_msgs::LaserScan & scan_msg);

    }

    void scan_callback(const sensor_msgs::LaserScan & scan_msg){
        sensor_msgs::LaserScan laser_msg;
        laser_msg = scan_msg;
        std::vector<float> laser_ranges;
        laser_ranges = laser_msg.ranges;
        size_t range_size = laser_ranges.size();
	double angle_increment = laser_msg.angle_increment;
	double first_angle_degree = 45; // was 90
	double first_angle_radian = first_angle_degree * M_PI / 180.0;
	double second_angle_degree = 90; // was 120
	double second_angle_radian = second_angle_degree * M_PI / 180.0;
    double third_angle_degree = 135;
    double third_angle_radian = third_angle_degree * M_PI / 180.0;
    double fourth_angle_degree = 180;
    double fourth_angle_radian = fourth_angle_degree * M_PI / 180.0;
	double theta = second_angle_radian - first_angle_radian; // was second then first
    size_t first_index = static_cast<size_t>(first_angle_radian / angle_increment);
	size_t second_index = static_cast<size_t>(second_angle_radian / angle_increment);
    size_t third_index = static_cast<size_t>(third_angle_radian / angle_increment);
    size_t fourth_index = static_cast<size_t>(fourth_angle_radian / angle_increment);
	double a = laser_ranges[first_index];
	double b = laser_ranges[second_index];
    double c = laser_ranges[third_index];
    double d = laser_ranges[fourth_index];
    
	double alpha = atan2(a * cos(theta) - b, a* sin(theta));
	double D_t = b * cos(alpha);

    // predict future
    double L = 0.025 * 1.0;
    double D_t1 = D_t + L * sin(alpha);

	double error = targetDistance - D_t1;
	integral +=error;
	if ( error * prevError < 0 || abs(error - prevError) < 0.01){
	    integral = 0;
	}
	double derivative = error - prevError;
	double pidResult = Kp * error + Ki * integral + Kd * derivative;
    double steering_angle;
    if (c < 1.5)
    {
        steering_angle = 1.5 * Kp * (d - b);
        drive_msg.speed = 1.2;
    }
    else if (c > 3)
    {
        steering_angle = pidResult * 0.12;
        drive_msg.speed = 2.4;
    }
    else
    {
	    steering_angle = pidResult;
        drive_msg.speed = 1.2;
    }
	prevError = error;
	prev_angle = steering_angle;
    steering_angle = std::max(-max_steering_angle, std::min(max_steering_angle, steering_angle));
    drive_msg.steering_angle = steering_angle;
  	drive_st_msg.drive = drive_msg;
  	drive_pub.publish(drive_st_msg);
	//ROS_INFO("[ROBOT] Dist: %f", distance);
	// ROS_INFO("[ROBOT] 90: %f", a);
	// ROS_INFO("[ROBOT] 120: %f", b);
        // ROS_INFO("[ROBOT] Porp: %f", error*Kp);
        // ROS_INFO("[ROBOT] Integ: %f", integral*Ki);
        // ROS_INFO("[ROBOT] Deriv: %f", derivative*Kd);
        ROS_INFO("[ROBOT] Angle: %f", steering_angle);
        // ROS_INFO("[ROBOT] E: %f", error);
    }
};
// end of class definition


int main(int argc, char ** argv) {
    ros::init(argc, argv, "wall_follow");
    wallfollow wf;
    ros::spin();
    return 0;
}
