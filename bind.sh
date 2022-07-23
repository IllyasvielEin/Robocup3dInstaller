ADir="\$bindir/rcssmonitor3d"
BDir="$( cd RoboViz && pwd)/roboviz.sh"
sudo sed -i "s#$ADir#${BDir}#" /usr/local/bin/rcsoccersim3d
echo "alias roboviz=\"${BDir}\"" >> ~/.bashrc
source ~/.bashrc
echo "Rebinding with RoboViz"

