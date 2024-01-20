#!/bin/bash
# Basic entrypoint for ROS / Colcon Docker containers
export ROS_DISTRO=humble
export ROS_DOMAIN_ID=32

# Source ROS 2
source /opt/ros/${ROS_DISTRO}/install/setup.bash
echo "Sourced ROS 2 ${ROS_DISTRO}"

# Source the base workspace, if built
if [ -f /mcdillo_ws/install/setup.bash ]
then
  source /mcdillo_ws/install/setup.bash
  echo "Sourced mcdillo base workspace"
fi

# Execute the command passed into this entrypoint
#exec "$@"