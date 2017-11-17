
sudo yum install git -y


sudo yum upgrade -y
sudo yum update -y
sudo yum install centos-release-scl -y
sudo yum install devtoolset-3-toolchain -y
sudo yum install gcc-c++ -y
sudo scl enable devtoolset-3 bash

sudo yum install -y ruby ruby-devel lua lua-devel luajit \
luajit-devel ctags git python python-devel \
python34 python34-devel tcl-devel \
perl perl-devel perl-ExtUtils-ParseXS \
perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
perl-ExtUtils-Embed libX11-devel
yum -y install cmake
yum install ncurses-devel

git clone https://github.com/chaosbaby/vim-tmux_setting.git /root/dofile
# vim 8 {{{ #

mkdir ~/tool
cd ~/tool
wget https://github.com/vim/vim/archive/master.zip
unzip master.zip
cd vim-master
cd src/
./configure --with-features=huge -enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config
sudo make
sudo make install
export PATH=/usr/local/bin:$PATH

# vimrc {{{ #
ln /root/dofile/vimDoFile/vimrcs/vim8.vimrc /root/.vimrc
# todo: install bundle in vimrc
# }}} vimrc #

# vundle {{{ #
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git
# }}} vundle #

# youcompleteme {{{ #
ln /root/dofile/vimDoFile/ubuntu.ycm_extra_conf.py /root/.ycm_extra_conf.py
cd ~/.vim/bundle/youcompleteme
./install.py --clang-completer
# }}} youcompleteme #

# }}} vim 8 #





# tmux setting
sudo yum install tmux
ln /root/dofile/tmux.conf /root/.tmux.conf


#git setting
git config --global user.email "50092526@qq.com"
git config --global user.name "chaos"
git config --global credential.helper store

#shell color
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -sf /root/dofile/bashrc /root/.barhrc
#shell
