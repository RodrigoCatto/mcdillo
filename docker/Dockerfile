#FROM dustynv/ros:galactic-desktop-l4t-r34.1.1
FROM ros:humble-ros-base

ARG ROS_DISTRO=humble

ENV ROS_DOMAIN_ID=32
ENV ROS_LOCALHOST_ONLY=0
SHELL ["/bin/bash", "-c"]

# Install Ydlidar SDK
RUN git clone https://github.com/YDLIDAR/YDLidar-SDK.git \
 && cd YDLidar-SDK/cmake/ \
 && cmake .. \
 && make \
 && sudo make install 


# Create an overlay Colcon workspace
RUN mkdir -p /mcdillo_ws/src
WORKDIR /mcdillo_ws
COPY ./mcdillo_bringup/ ./src/mcdillo_bringup/
COPY ./ydlidar_ros2_driver/ ./src/ydlidar_ros2_driver/
#RUN git clone https://github.com/foxglove/ros-foxglove-bridge.git ./src/ros-foxglove-bridge/


# sudo apt-get install libresource-retriever-dev
# sudo apt-get install libwebsocketpp-dev
# sudo apt install nlohmann-json3-dev

# Intall Foxglove and Irobot custom messages
RUN sudo apt-get update -y \
&& sudo apt install ros-$ROS_DISTRO-foxglove-bridge -y \
&& sudo apt install ros-$ROS_DISTRO-irobot-create-msgs -y

# Install dependencies and build workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
&& rosdep update \
&& rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y \
&& colcon build --symlink-install \
&& source install/setup.bash

# Set up the entrypoint
#COPY ./docker/entrypoint.sh /
#ENTRYPOINT [ "/entrypoint.sh" ]

