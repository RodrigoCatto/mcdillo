# mcdillo
IRobot Create 3 repo using Jetson Nano

Clone the repository:
```
mkdir mcdillo_ws
cd mcdillo_ws
git clone --recursive https://github.com/RodrigoCatto/mcdillo.git src
```

1. Go to the src folder\
```cd ~/mcdillo/src/ ```
   
2. Build the Docker Container\
```docker build -f docker/Dockerfile -t mcdillo_ws . ```

3. Run the Container\
```docker run -it --net=host --ipc=host --privileged -v /dev/ydlidar:/dev/ydlidar -e DISPLAY=$DISPLAY mcdillo_ws```

4. Mcdillo Keyboard Teleop\
```ros2 run teleop_twist_keyboard teleop_twist_keyboard```

5. Foxglove node to watch topics\
```ros2 launch foxglove_bridge foxglove_bridge_launch.xml port:=8765```
