#!/bin/bash

version_dir=$(curl -s "https://www.kernel.org/pub/linux/kernel/projects/backports/stable/?C=N;O=D" | grep 'a href="v' | head -n 1 | cut -d ">" -f 2 | cut -d "/" -f 1)
file=$(curl -s https://www.kernel.org/pub/linux/kernel/projects/backports/stable/$version_dir/ | grep 'a href="backports-' | head -n 1 | cut -d "-" -f 2-3 | cut -d '"' -f 1)
file="backports-$file"

echo "Latest: $file"

if [ ! -f ~/Downloads/$file ]
then
  curl -LO https://www.kernel.org/pub/linux/kernel/projects/backports/stable/$version_dir/$file
  curl -LO https://www.kernel.org/pub/linux/kernel/projects/backports/stable/$version_dir/sha256sums.asc
fi

cat sha256sums.asc | grep $file > $file.sha256
sha256sum -c $file.sha256
rm -f $file.sha256

backports_dir=$(basename $file .tar.gz)
cd ~/Downloads
if [ ! -d $backports_dir ]
then
  tar -xvf $file
fi

cd $backports_dir
make defconfig-wifi
core_count=$(cat /proc/cpuinfo | grep processor | wc -l)
((core_count++))
make -j $core_count
sudo make install
sudo update-initramfs -u -k all

echo "Done, reboot to load the backports drivers"
