yum remove vim* -y
yum install ncurses-devel -y
cd /usr/local/src/
wget https://codeload.github.com/vim/vim/tar.gz/v8.0.0134
tar zxf v8.0.0134
cd vim-8.0.0134/
./configure --prefix=/usr/local/vim8
make && make install
export PATH=$PATH:/usr/local/vim8/bin/

