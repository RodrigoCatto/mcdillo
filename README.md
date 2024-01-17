# mcdillo
IRobot Create 3 repo using Jetson Nano

docker build -f docker/Dockerfile -t mcdillo_ws .

docker run -it --net=host --ipc=host --privileged -v /dev/ydlidar:/dev/ydlidar -e DISPLAY=$DISPLAY mcdillo_ws

ros2 run teleop_twist_keyboard teleop_twist_keyboard

ros2 launch foxglove_bridge foxglove_bridge_launch.xml port:=8765