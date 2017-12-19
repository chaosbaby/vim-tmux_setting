# *********"install for luarocks   "*************
mkdir ~/tool
cd ~/tool
wget https://luarocks.org/releases/luarocks-2.4.3.tar.gz
tar zxpf luarocks-2.4.3.tar.gz
cd luarocks-2.4.3
./configure --prefix=/usr/local/luarock-2.4.3
# ./configure --prefix=/usr/local/luarock-2.4.3 --with-lua-bin=/root/tool/lua-5.1.5/src --with-lua-include=/home/chaos/tool/lua-5.1.5/src/
make build
make install
ln /usr/local/luarock-2.4.3/bin/luarocks-5.1 /usr/bin/luarocks


# *********"install for luasql and mysql "*************
yum install -y mariadb-server mariadb-client mariadb-devel
ln -s /usr/lib64/mysql/libmysqlclient.so /usr/local/lib
luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql/
yum install -y sqlite sqlite-devel
luarocks install luasql-sqlite3

# *********"install for sqlite"*************
yum install -y sqlite sqlite-devel
luarocks install luasql-sqlite3
