#!/bin/sh

# exit script on first error, 
# (stops execution any further commands)
set -e

# get the .net pacjkage signing key
sudo add-apt-repository ppa:dotnet/backports

sudo apt-get update 

sudo apt remove -y dotnet* aspnetcore* netstandard*

# install the .net sdk
sudo apt install -y dotnet-sdk-9.0

# install build requirements
sudo apt-get install -y \
  build-essential \
  scons \
  pkg-config \
  libx11-dev \
  libxcursor-dev \
  libxinerama-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libasound2-dev \
  libpulse-dev \
  libudev-dev \
  libxi-dev \
  libxrandr-dev \
  libwayland-dev

