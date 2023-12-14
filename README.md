# mcdillo
IRobot Create 3 repo using Jetson Nano


docker build -f docker/Dockerfile -t mcdillo_ws .

docker run -it --net=host --ipc=host --privileged mcdillo_ws

ros2 run teleop_twist_keyboard teleop_twist_keyboard