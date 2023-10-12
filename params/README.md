# Params

## Edit Project

Once inside docker container shell, you can start editing the jackal workspace. 
Parameters for Move Base: https://github.com/Daffan/nav-competition-icra2022/tree/main/jackal_helper/configs/params

Goto Parameter Folder (pwd: jackal_ws/)

    cd src/nav-competition-icra2022/jackal_helper/configs/params/

Install nano, if you haven't already

    sudo apt install nano

Edit File

    sudo nano [filename].yaml


# Replicating Team Results

To replicate, you need to adjust base_local_planner_params.yaml with our file (pwd: jackal_ws/)

  ```
  sudo nano src/nav-competition-icra2022/jackal_helper/configs/params/base_local_planner_params.yaml
  ```

  ```
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
  ```

# Team Results


Our team results

- Vanilla Jackal Results: https://youtu.be/09wVBX-gjHk
- Adjusted Jackal Results: https://youtu.be/umRLDLUrH78

```
    Vanilla Jackal: ~ 55 seconds
    Adjusted Jackal: ~14 seconds
```

![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Info1.png?raw=true)

![alt text](https://github.com/katazui/ROS_Barn_Docker/blob/main/images/Milestones.png?raw=true)
