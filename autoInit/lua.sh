# *********"install lua shell  "*************
yum install libtermcap-devel ncurses-devel libevent-devel readline-devel
mkdir ~/tool
cd ~/tool
wget http://www.lua.org/ftp/lua-5.1.5.tar.gz
tar zxf lua-5.1.5.tar.gz
cd lua-5.1.5
make linux test
ln ~/tool/lua-5.1.5/src/lua /usr/bin/lua5.1

# *********"install luarocks   "*************
yum install libtermcap-devel ncurses-devel libevent-devel readline-devel
mkdir ~/tool
cd ~/tool
wget https://luarocks.org/releases/luarocks-2.4.3.tar.gz
tar zxpf luarocks-2.4.3.tar.gz
cd luarocks-2.4.3
./configure --prefix=/usr/local/luarock-2.4.3 --with-lua-bin=/root/tool/lua-5.1.5/src --with-lua-include=/home/chaos/tool/lua-5.1.5/src/
make build
make install
ln /usr/local/luarock-2.4.3/bin/luarocks-5.1 /usr/bin/luarocks


# *********"install luasql and mysql "*************
yum install -y mariadb-server mariadb-client mariadb-devel
ln -s /usr/lib64/mysql/libmysqlclient.so /usr/local/lib
luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql/
yum install -y sqlite sqlite-devel
luarocks install luasql-sqlite3

# *********"install sqlite"*************
yum install -y sqlite sqlite-devel
luarocks install luasql-sqlite3

ln /usr/local/luarock-2.4.3/lib/lua /usr/local/lib/lua -s
ln /usr/local/luarock-2.4.3/share/lua/ /usr/local/share/lua -s
ln /usr/local/luarock-2.4.3/share/lua/ /usr/share/lua -s
