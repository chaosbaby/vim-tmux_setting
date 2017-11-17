wget
tar -xvzf Python-3.5.1.tgz
cd python-3.5.1/
./configure -prefix=/usr/python
make
make install


sudo ./configure --with-features=huge --enable-python3interp=yes --with-python3-config-dir=/usr/lib64/python3.4/config-3.4m/
make
make install
vim --version
