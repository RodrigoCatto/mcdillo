FROM dustynv/ros:humble-desktop-l4t-r34.1.1

ARG ROS_DISTRO=humblr
ENV ROS_DOMAIN_ID=32
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

#RUN rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y
RUN source /opt/ros/${ROS_DISTRO}/install/setup.bash \
 && colcon build --symlink-install
#RUN colcon build --symlink-install

# Set up the entrypoint
#COPY ./docker/entrypoint.sh /
#ENTRYPOINT [ "/entrypoint.sh" ]