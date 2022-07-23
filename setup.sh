#!/bin/bash
echo "Robocup3D simulation Server and Monitor Installer"

sudo apt update

sudo apt upgrade -y

sudo apt install git -y

sudo apt install build-essential subversion cmake make libfreetype6-dev libsdl1.2-dev ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt5-default openjdk-8-jdk -y

git submodule update --init

chmod +x -R *.sh

sudo apt install autogen automake libtool libtbb-dev -y
cd ode-tbb || exit
./autogen.sh
./configure --enable-shared --disable-demos --enable-double-precision --disable-asserts --enable-malloc
make -j$(nproc)
sudo make install
cd ..

bash ./install_simspark.sh --source

chmod 777 -R RoboViz

bash ./bind.sh --source
 
echo "Installation Done"
