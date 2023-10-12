# Running BARN Project with Docker

This project runs the BARN project with Docker on Linux/Mac/Windows. The GUI (gazebo) requires a Windows with NVIDA. The GUI will not work on Linux/Mac, but the project files will still run

## Prequesites

    1. Docker Desktop
    2. VCXSRV: https://sourceforge.net/projects/vcxsrv/ (For Gui, Windows ONLY)
    3. NVIDA

# Starting Project

## Copy Project to Folder

    Project
      |___Dockerfile
      |___README.md


## Build

    docker build -t barn_ros_noetic .

## Run

    docker run -it barn_ros_noetic

## WINDOWS: Run Docker with Display and Enter Container Shell

    docker run -it -e DISPLAY=host.docker.internal:0.0 barn_ros_noetic /bin/bash

## MAC: Run Docker with Display / Enter Container Shell

1A: Start xhost (Need xQuartz/x11)
    
    ```xhost + 127.0.0.1```


2A: Enter docker container with xQuartz + LibGL

    docker run -it \
    -e DISPLAY=host.docker.internal:0.0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /usr/lib/x86_64-linux-gnu/libGL.so.1:/usr/lib/x86_64-linux-gnu/libGL.so.1 \
    barn_ros_noetic \
    /bin/bash

[OR]

1B: Enter docker container

    docker run -it \
    -e DISPLAY=host.docker.internal:0 \
    barn_ros_noetic \
    /bin/bash

[OR]

1C: Start xhost (Need xQuartz/x11)

    xhost + 127.0.0.1

2C: 1Enter docker container with xQuartz

    docker run -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    barn_ros_noetic \
    /bin/bash


## Once Inside Docker Container Shell

    To edit parameters for move_base (https://github.com/Daffan/nav-competition-icra2022/tree/main/jackal_helper/configs/params)
    ```
    cd src/nav-competition-icra2022/jackal_helper/configs/params/
    ```

    To Run Simulation
    ```
    cd src/nav-competition-icra2022/
    ```
    ```
    python3 run.py --world_idx [number] --gui
    ```
