# mcdillo
IRobot Create 3 repo using Jetson Nano

1. Build the Docker Container\
```docker build -f docker/Dockerfile -t mcdillo_ws . ```

2. Run the Conteiner\
```docker run -it --net=host --ipc=host --privileged -v /dev/ydlidar:/dev/ydlidar -e DISPLAY=$DISPLAY mcdillo_ws```

3. Mcdillo Keyboard Teleop\
```ros2 run teleop_twist_keyboard teleop_twist_keyboard```

4. Foxglove node to watch topics\
```ros2 launch foxglove_bridge foxglove_bridge_launch.xml port:=8765```
