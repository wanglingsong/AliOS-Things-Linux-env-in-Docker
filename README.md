# How to build your AliOS-Things app from a Linux docker

* Download the Dockerfile in this repo
* Build Docker image
```
docker build -t myaos .
```
* Run the image in interative mode with your AOS directory mounted to /opt/aos
```
docker run -i -t -v [path-to-your-aos-source-directory]:/opt/aos myaos /bin/bash
```
* Start building inside Docker
```
aos make helloworld@linuxhost
```
