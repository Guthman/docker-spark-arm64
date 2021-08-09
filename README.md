# Introduction
This repo is for building and running an Spark Docker image on an Arm64 system. The deployment consists of one master node and one worker node.

Developed and tested on aarch64, using Oracle Linux 8.

# Instructions
Copy the repo using  
`git clone https://github.com/Guthman/docker-spark-arm64.git docker-spark-arm64`  

Make the build script executable using  
`sudo chmod rwxrwxr-- start.sh`  

Run start.sh to build and run the image (warning: the script will remove stopped containers using docker prune!):

`sudo ./start.sh`  
The start script assumes the repo contents are in a folder called 'docker-spark-arm64' in the home directory.

# Current status
Not working.

# Credits
The repo is forked from https://github.com/bitnami/bitnami-docker-spark/