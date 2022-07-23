#!/bin/bash

echo "Robocup 3D simulation Env installation script START"

sudo apt update

# sudo apt-get reinstall apt-transport-https ca-certificates

# sudo sed -i 's/cn.archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# sudo apt install 

# sudo apt update  

# sudo apt install git -y

cd ~

mkdir ./.local/Robocup3d -p

cd ./.local/Robocup3d

git clone https://gitee.com/IllyasvielEin/Robocup3dInstaller.git

cd Robocup3dInstaller

bash ./setup.sh

echo "Robocup 3D simulation Env installation script END"
