# ROS2DashingNav2
TurtleBot 3 ROS2 Dashing Navigation Sample App

TurtleBot 3 ROS2 Dashing Navigation Sample App. Currently this demo only works on ROS2 Dashing
Few modifications from available setup located @ https://navigation.ros.org/getting_started/index.html

Run script installTurtleBot3Nav2.sh to install ROS2 & Gazebo9 (TurtleBot3 is build from source in a workspace called dev_ws )

# Get script
cd ~
git clone https://github.com/chazyman/ROS2DashingNav2.git

# Make script executable
cd ~/ROS2DashingNav2

chmod +x installTurtleBot3Nav2.sh


# Run script
./installTurtleBot3Nav2.sh

# To run Sample in a Terminal run following commands (follow step 3 - 4 & Navigating see above link) Make sure you position turtleBot3 in Rviz at a simalar location in the Gazebo World. 


source /usr/share/gazebo/setup.sh

source ~/dev_ws/install/setup.bash

export TURTLEBOT3_MODEL=waffle

export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/dev_ws/install/turtlebot3_gazebo/share/turtlebot3_gazebo/models

ros2 launch nav2_bringup nav2_simulation_launch.py
