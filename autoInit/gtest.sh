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
