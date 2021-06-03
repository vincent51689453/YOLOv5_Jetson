# YOLOv5_Jetson
This repository is implementing YOLOv5 in Jetson Xavier NX with docker. It supports realtime object detection using USB camera and object detection of a single image or video vile. **This package was tested in NVIDIA Xavier NX (Developer Kit Version) with Jetpack 4.5.1 [L4T 32.5.1]**

## Environmental Setup
1) Update and Upgrade the entire system
```
sudo apt-get update
sudo apt-get upgrade
```
3) Install pip and pip3
```
sudo apt-get install python3-pip
sudo apt-get install python-pip
```
3) Install jtop for system status monitoring
```
sudo -H pip install -U jetson-stats
```
4) Install VScode for development
After downloading the debian package from https://code.visualstudio.com/Download
```
sudo dpkg -i <vscode_package>.dep
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
#start vscode
code 
```
5) Pull docker image from NVIDIA NGC
```
sudo docker pull nvcr.io/nvidia/l4t-ml:r32.5.0-py3
```
6) Download YOLOv5 repository
```
sudo git clone https://github.com/ultralytics/yolov5
cd ..
mv yolov4/ standard
```
9) Create docker container
```
cd container_tools
# Please attach USB camera to Xavier if you want to use USB camera in this docker
./container_create.sh
```
10) Install all necessary dependencies for YOLOv5 inside the container
```
apt-get update
# Make sure opencv,torch and torch vision are not installed
pip3 install -r requirments.txt
```

11) Unlock python version limitaiton
You can go to standard/tuils/generaly.py and search for check_python(). After changing the "minimum=3.7.0" to "minimum=3.6.0", you can execute YOLOv5 by python3.6.

12) Display setup for docker container
```
# Outside the container
echo $DISPLAY -> example of output= :1
# Therefore you need to set the display inside the container

# Inside the container
export DISPLAY =:1
```

## How To Use
1) USB Camera realtime object detection
```
./start_camera_detect.sh
```
2) Image or Video object detection
```
./start_image_detect.sh
```
