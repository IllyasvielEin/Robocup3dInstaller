dir="/usr/local/"

cd ${dir}/bin
sudo rm -rf rcs* salt-config *spark* zei*
cd ..

cd ${dir}/include
sudo rm -rf !\(ode\)
cd ..

cd ${dir}/lib
sudo rm -rf !\(libode*\|python*\|pkgconfig\)
cd ..

cd ${dir}/share
sudo rm -rf doc rcss* simspark
cd ..

echo "remove over."