#!/bin/bash

# https://emanual.robotis.com/docs/en/platform/turtlebot3/ros2_setup/
# Step 1 Install ROS2 (Dashing)
# https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/
# Set Local
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt-get update && sudo apt-get install curl gnupg2 lsb-release

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

sudo apt-get update
sudo apt-get install ros-dashing-desktop
#
#  Setup TurtleBot 3
# Install Gazebo 9
#
curl -sSL http://get.gazebosim.org | sh
#
### Uninstall Gazebo11 previously via above
#
sudo apt-get purge gazebo11 libgazebo11-dev
# 
sudo apt-get install gazebo9 libgazebo9-dev

sudo apt-get install ros-dashing-gazebo-ros-pkgs
cd 
# Catographer
#
sudo apt-get install ros-dashing-cartographer

sudo apt-get install ros-dashing-cartographer-ros

# Navigation2
#
sudo apt-get install ros-dashing-navigation2

sudo apt-get install ros-dashing-nav2-bringup

# Install ROS dep
sudo apt-get install python3-rosdep
sudo rosdep init
rosdep update

# Test Gazebo works with ROS2
# In Terminal 1
source ~/dev_ws/install/setup.bash
gazebo --verbose /opt/ros/dashing/share/gazebo_plugins/worlds/gazebo_ros_diff_drive_demo.world

# In Terminal 2
source ~/dev_ws/install/setup.bash
# gedit /opt/ros/dashing/share/gazebo_plugins/worlds/gazebo_ros_diff_drive_demo.world
ros2 topic pub /demo/cmd_demo geometry_msgs/Twist '{linear: {x: 1.0}}' -1

# VCStool
sudo apt-get install python3-vcstool

## Install TurtlBot 3 Package in WorkSpace
mkdir -p ~/dev_ws/src
wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
vcs import src < turtlebot3.repos

# Check-out ROS2 Dashing
vcs custom --args checkout dashing-devel

# Set Underlay ROS2 Dashing - Build TurleBot3 WorkSpace - Set Workspace Overlay
source /opt/ros/dashing/setup.bash
cd ..
rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install
source ~/dev_ws/install/local_setup.bash
colcon build --symlink-install
