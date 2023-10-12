FROM ros:noetic

# Set environment variables
ENV ROS_WS /root/jackal_ws

# Update and install dependencies
RUN apt-get update
RUN apt-get install -y python3-venv
RUN apt-get install -y git
RUN apt-get install -y python3-pip
RUN apt-get install -y x11-apps
RUN apt-get install -y tmux
RUN apt-get install -y ros-noetic-rviz
RUN apt-get install -y nano

# Install OpenGL-related libraries
RUN apt-get update && apt-get install -y libgl1-mesa-glx libgl1-mesa-dri mesa-utils
ENV LIBGL_ALWAYS_SOFTWARE=1

# Setup python virtual environment
RUN python3 -m venv /root/nav_challenge
ENV PATH="/root/nav_challenge/bin:$PATH"

# Install Python dependencies including empy
RUN pip3 install defusedxml rospkg netifaces numpy empy

# Create ROS workspace
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS/src

# Clone the repo and required ROS packages
RUN git clone https://github.com/Daffan/nav-competition-icra2022.git
RUN git clone https://github.com/jackal/jackal.git --branch noetic-devel
RUN git clone https://github.com/jackal/jackal_simulator.git --branch melodic-devel
RUN git clone https://github.com/jackal/jackal_desktop.git --branch melodic-devel
RUN git clone https://github.com/utexas-bwi/eband_local_planner.git

# Modify jackal_helper CMakeLists.txt to use C++17
RUN sed -i '3s/-std=c++11/-std=c++17/' $ROS_WS/src/nav-competition-icra2022/jackal_helper/CMakeLists.txt

# Install ROS package dependencies
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then rosdep init; fi
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    rosdep update && \
    rosdep install -y --from-paths . --ignore-src --rosdistro=noetic"

# Build the workspace
WORKDIR $ROS_WS
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make -DCMAKE_VERBOSE_MAKEFILE=ON"

# Set entry point to run simulations by default
#CMD [ "bash", "-c", "source devel/setup.bash && python3 /root/jackal_ws/src/nav-competition-icra2022/run.py --world_idx 0 --gui" ]
CMD [ "bash", "-c", "source devel/setup.bash" ]


