# How to build your AliOS-Things app from a Linux docker

* Download the Dockerfile in this repo
* Build Docker image
```
docker build -t myaos .
```
* Run the image and build aos with your AOS directory mounted to /opt/aos
```
docker run --rm -v [path-to-your-aos-source-directory]:/opt/aos myaos aos make helloworld@linuxhost
```
