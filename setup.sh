#!/bin/bash
echo "Robocup3D simulation Server and Monitor Installer"

sudo apt update

sudo apt upgrade -y

sudo apt install git -y

git submodule update --init

code_name=$(lsb_release -r --short)

sleep_time=5

edition=${code_name:0:2}

if [ "${edition}" = "20" ]
then
    echo "Your ubuntu edition is ${code_name}. Installation 1 will start after ${sleep_time} s."
    sleep ${sleep_time}
    sudo add-apt-repository ppa:rock-core/qt4
    sudo apt update
    sudo apt install build-essential subversion g++ cmake libfreetype6-dev libode-dev libsdl-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt4-default openjdk-8-jdk -y
elif [ "${edition}" = "21" ]
then
    #   under design.
    echo "Your ubuntu edition is ${code_name}. Please install the Dependency Library manually."
    exit 1
else
    echo "Your ubuntu edition is ${code_name}. Installation 2 will start after ${sleep_time} s."
    sleep ${sleep_time}
    sudo apt install build-essential subversion cmake make libfreetype6-dev libsdl1.2-dev ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt4-default openjdk-8-jdk -y
fi

sudo apt install autogen automake libtool libtbb-dev -y
cd ode-tbb || exit
./autogen.sh
./configure --enable-shared --disable-demos --enable-double-precision --disable-asserts --enable-malloc
make -j$(nproc)
sudo make install
cd ..

cd SimSpark || exit
bash ./clean.sh
bash ./build.sh
bash ./clean.sh
cd ..

chmod 777 -R RoboViz
 
ADir="\$bindir/rcssmonitor3d"
BDir="$( cd RoboViz && pwd)/roboviz.sh"
sudo sed -i "s#$ADir#${BDir}#" /usr/local/bin/rcsoccersim3d
echo "Rebinding with RoboViz"

echo "Installation Done"