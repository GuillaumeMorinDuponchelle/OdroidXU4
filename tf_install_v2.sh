echo ''
echo 'TensorFlow & OpenCV install'
echo ''
echo 'Install on Lubuntu 14.04 Odroid XU4' 
echo ''
echo 'Update and install dependencies TF'
sleep 3
sudo apt-get update
sleep 7

# For Python 2.7
sudo apt-get install python-pip python-dev -y

# For Python 3.3+
sudo apt-get install python3-pip python3-dev -y


wget https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v1.0.1/tensorflow-1.0.1-cp27-none-linux_armv7l.whl
sudo pip install tensorflow-1.0.1-cp27-none-linux_armv7l.whl


wget https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v1.0.1/tensorflow-1.0.1-cp34-cp34m-linux_armv7l.whl
sudo pip3 install tensorflow-1.0.1-cp34-cp34m-linux_armv7l.whl

sudo pip uninstall mock
sudo pip install mock

echo ''
echo 'Test the Tensorflow install '
echo ''
echo 'python >>> import tensorflow as tf'
echo ''
echo 'python3 >>> import tensorflow as tf'
echo ''
sleep 60

echo 'OpenCV'
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential cmake git pkg-config
sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libgtk2.0-dev
sudo apt-get install libatlas-base-dev gfortran

wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

sudo apt-get install python3.4-dev
pip install numpy

sleep 30

echo 'Install and Build OpenCV 3.1.0'
mkdir opencv_tmp

cd opencv_tmp
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.1.0

cd ~
mkdir opencv_contrib_tmp
cd opencv_contrib_tmp
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.1.0

cd ~/opencv_tmp/opencv
mkdir build 
cd build

echo 'BUILDING OPENCV'
sleep 4

cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_OPENGL=ON -DWITH_V4L=ON -DWITH_TBB=ON -DBUILD_TBB=ON -DENABLE_VFPV3=ON -DENABLE_NEON=ON ..

make -j4

sudo make install
sudo ldconfig
