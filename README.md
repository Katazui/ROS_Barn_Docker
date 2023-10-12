# Running BARN Project with Docker

This project runs the BARN project with Docker on Linux/Mac/Windows. The GUI (gazebo) requires a Windows with NVIDA. The GUI will not work on Linux/Mac, but the project files will still run
![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Title.png?raw=true)

## Prerequisites

1. Docker Desktop
2. VCXSRV: https://sourceforge.net/projects/vcxsrv/ (For Gui, Windows ONLY)
3. NVIDA

![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Milestones.png?raw=true)

# Starting Project

Copy Project to Folder

    Project
      |___Dockerfile
      |___README.md


Build

    docker build -t barn_ros_noetic .

Run

    docker run -it barn_ros_noetic

# Entering Docker Container Shell

WINDOWS: Run Docker with Display and Enter Container Shell

    docker run -it -e DISPLAY=host.docker.internal:0.0 barn_ros_noetic /bin/bash

[OR]

MAC: Run Docker with Display / Enter Container Shell

1A: Start xhost (Need xQuartz/x11)
    
    xhost + 127.0.0.1


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


# Edit Project

Once inside docker container shell, you can start editing the jackal workspace. 
Parameters for Move Base: https://github.com/Daffan/nav-competition-icra2022/tree/main/jackal_helper/configs/params

Goto Parameter Folder (pwd: jackal_ws/)

    cd src/nav-competition-icra2022/jackal_helper/configs/params/

Install nano, if you haven't already

    sudo apt install nano

Edit File

    sudo nano [filename].yaml


# Replicating Team Results

Adjust base_local_planner_params.yaml (pwd: jackal_ws/)

    src/nav-competition-icra2022/jackal_helper/configs/params/base_local_planner_params.yaml

Our Team Simulations to replicate results, use this file: https://github.com/Katazui/ROS_Barn_Docker/blob/main/params/base_local_planner_params.yaml

    TrajectoryPlannerROS:

      # Robot Configuration Parameters
      acc_lim_x: 10.0
      acc_lim_theta:  20.0
    
      max_vel_x: 5.37
      min_vel_x: 0.1
    
      max_vel_theta: 3.57
      min_vel_theta: -3.57
      min_in_place_vel_theta: 0.314
    
      holonomic_robot: false
      escape_vel: -1.0

Our team results

- Vanilla Jackal Results: https://youtu.be/09wVBX-gjHk
- Adjusted Jackal Results: https://youtu.be/umRLDLUrH78

```
    Vanilla Jackal: ~ 55 seconds
    Adjusted Jackal: ~14 seconds
```

![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Info1.png?raw=true)

# Run Simulation

Setup Source (pwd: jackal_ws/)

    source devel/setup.bash

Goto Simulation Folder

    cd src/nav-competition-icra2022/

Run Simulation

    python3 run.py --world_idx [number] --gui

# Thank you!
![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Thanks.png?raw=true)
![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Members.png?raw=true)
