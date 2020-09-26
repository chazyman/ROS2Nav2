# ROS2
TurtleBot 3 ROS2 Dashing Navigation Sample App. Currently this demo only works on ROS2 Dashing
Few modifications from available setup located @ https://navigation.ros.org/getting_started/index.html

Run script installTurtleBot3Nav2.sh to install ROS2 & Gazebo9 (TurtleBot3 is build from source in a workspace called dev_ws )

To run Sample in a Terminalrun following commands
source /usr/share/gazebo/setup.sh
source ~/dev_ws/install/setup.bash
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/dev_ws/install/turtlebot3_gazebo/share/turtlebot3_gazebo/models

ros2 launch nav2_bringup nav2_simulation_launch.py

