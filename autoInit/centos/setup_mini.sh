sudo yum upgrade -y
sudo yum update -y

yum install net-tool -y

#git setting
yum install git -y
git config --global user.email "50092526@qq.com"
git config --global user.name "chaos"
git config --global credential.helper store

# dofiles
mkdir ~/tool
cd ~/tool
git clone https://github.com/int32bit/dotfiles.git

## dofiles: tmux
sudo yum -y install tmux
cd ~/tool/dotfiles/tmux
sh setup.sh

## dofiles: zsh
yum install zsh -y
cd ~/tool/dotfiles/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
sh setup.sh

