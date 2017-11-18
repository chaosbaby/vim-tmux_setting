sudo yum install git -y


sudo yum upgrade -y
sudo yum update -y
sudo yum install centos-release-scl -y
sudo yum install devtoolset-3-toolchain -y
sudo yum install gcc-c++ -y

sudo yum install -y ruby ruby-devel lua lua-devel luajit \
luajit-devel ctags git python python-devel \
python34 python34-devel tcl-devel \
perl perl-devel perl-ExtUtils-ParseXS \
perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
perl-ExtUtils-Embed libX11-devel
yum -y install cmake
yum -y install ncurses-devel

sudo scl enable devtoolset-3 bash
