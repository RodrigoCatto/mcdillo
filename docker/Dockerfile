FROM dustynv/ros:humble-desktop-l4t-r34.1.1

ARG ROS_DISTRO=galactic
ENV ROS_DOMAIN_ID=32
SHELL ["/bin/bash", "-c"]

# Create an overlay Colcon workspace
RUN mkdir -p /mcdillo_ws/src
WORKDIR /mcdillo_ws
COPY ./mcdillo_bringup/ ./src/mcdillo_bringup/
COPY ./ydlidar_ros2_driver/ ./src/ydlidar_ros2_driver/

#RUN rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y
RUN colcon build --symlink-install

# Set up the entrypoint
COPY ./docker/entrypoint.sh /
#ENTRYPOINT [ "/entrypoint.sh" ]