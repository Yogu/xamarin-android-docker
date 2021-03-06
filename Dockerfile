FROM ubuntu:16.04

MAINTAINER Atsushi Eno <atsushieno@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list
RUN echo "deb http://download.mono-project.com/repo/debian alpha main" | tee /etc/apt/sources.list.d/mono-xamarin-alpha.list
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install curl openjdk-8-jdk git make automake autoconf libtool unzip vim-common clang nuget mono-xbuild referenceassemblies-pcl lib32stdc++6 lib32z1 libzip4 lsb-core sudo pkg-config

RUN mkdir /sources
RUN cd /sources && git clone --recursive --depth 1 https://github.com/xamarin/xamarin-android.git
RUN cd /sources/xamarin-android && yes | make prepare
RUN cd /sources/xamarin-android && make
