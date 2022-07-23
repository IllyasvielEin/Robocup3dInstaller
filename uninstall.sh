#!/bin/bash

dir="/usr/local/"

shopt -s extglob

cd ${dir}/bin
sudo rm -rf rcs* salt-config *spark* zei* kerosin-config 
cd ..

cd ${dir}/include
sudo rm -rf !(ode)
cd ..

cd ${dir}/lib
sudo rm -rf !(libode*|python*|pkgconfig)
cd ..

cd ${dir}/share
sudo rm -rf doc rcss* simspark
cd ..

shopt -u extglob

echo "remove over."