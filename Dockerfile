FROM ubuntu:16.04

MAINTAINER Leo WANG <wanglingsong@gmail.com>

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
    deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n\
    ' > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python \
        gcc-multilib \
        libssl-dev \
        libncurses5-dev \
        libreadline-dev \
        python-pip \
        minicom \
        wget \
        bzip2

RUN pip install -U pip setuptools && \
    pip install aos-cube

RUN cd /opt && \
    wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 && \
    tar xf gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 && \
    rm gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2

RUN echo "export TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-5_4-2016q3/bin/"

RUN mkdir /opt/aos
WORKDIR /opt/aos