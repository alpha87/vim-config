#!/bin/bash
echo "正在安装 neovim 配置文件..."
# if which apt-get >/dev/null; then
# 	sudo apt-get install -y git python-dev python-pip python3-dev python3-pip
# elif which yum >/dev/null; then
# 	echo "Centos 可能不兼容, 报错请Google..."
# 	sudo yum install -y gcc vim git python-setuptools python-devel epel-release
# 	curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
# 	sudo yum -y install neovim
# fi

# # Add HomeBrew support
# if which brew >/dev/null;then
#     echo "You are using HomeBrew tool and install neovim"
#     brew install neovim
# fi

# 自动格式化代码 flake代码检查 neovim依赖
sudo pip install autopep8 flake8 neovim

# 安装vim-plug插件
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 判断nvim的config是否存在

# 如果已经存在配置会被删除
if [ -d !/.config/nvim ];then
      rm -rf ~/.config/nvim
fi

if [ ! -d ~/.config/nvim ];then
      mkdir -p ~/.config/nvim
fi

# 拷贝nvim配置
git clone https://github.com/alpha87/vim-config.git ~/.config/nvim

# 拷贝gruvbox配色
git clone https://github.com/morhetz/gruvbox.git ~/.config/nvim/gruvbox

# 应用配色
cp -r ~/.config/nvim/gruvbox/colors ~/.config/nvim

# 删除多余文件
rm -rf ~/.config/nvim/gruvbox

echo "➡️ 进入nvim执行 :PlugInstall "
