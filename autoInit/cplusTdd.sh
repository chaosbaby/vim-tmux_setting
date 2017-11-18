mkdir ~/tool
cd ~/tool
wget https://codeload.github.com/open-source-parsers/jsoncpp/zip/master
mv master jsoncpp.zip
unzip jsoncpp.zip
mv jsoncpp-master/ jsoncpp
vim .bashrc
yum install scons
source .bashrc
cd  $JSONCPP_HOME
scons platform=linux-gcc
cd libs/linux-gcc-4.8.5/
ln -s libjson_linux-gcc-4.8.5_libmt.a libjson_linux-gcc-4.8.5.a


mkdir ~/tool
cd ~/tool
tar -jxvf boost_1_64_0.tar.bz2
source .bashrc
cd $BOOST_ROOT
./bootstrap.sh --with-libraries=filesystem,system
./b2


mkdir ~/tool
cd ~/tool
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rlog/rlog-1.4.tar.gz
tar -zxvf rlog-1.4.tar.gz
source .bashrc
cd $RLOG_HOME
./configure
make


mkdir ~/tool
cd ~/tool
unzip cpputest-3.8.zip
mv cpputest-3.8 /home/chaos/cpputest
vim .bashrc
source .bashrc
cd $CPPUTEST_HOME
cd cpputest_build/
yum -y install gcc gcc-c++ autoconf
yum install libtool
sudo autoreconf .. -i
sudo ../configure

mkdir ~/tool
cd ~/tool
wget https://codeload.github.com/chaosbaby/googletest/zip/master
mv master master.zip
unzip master.zip
mv googletest-master/ gtest
cd gtest/
mkdir mybuild
cd mybuild/
cmake ..
make
make install
