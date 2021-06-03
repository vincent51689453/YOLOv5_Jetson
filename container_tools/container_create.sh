xhost +
sudo docker run -it --gpus all --device=/dev/video0:/dev/video0 -v /home/xavier/vincent-dev/docker_ws/YOLOv5_ws:/yolov5 -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -p 1000:8888 nvcr.io/nvidia/l4t-ml:r32.5.0-py3
