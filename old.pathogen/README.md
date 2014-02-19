===========
conf_vim
===========

config file of my vim
ln -sf /home/wyy/conf_vim /root/.vim
ln -sf /home/wyy/conf_vim /home/wyy/.vim

cat >> /etc/vim/vimrc <<EOF
source /home/wyy/conf_vim/vimrc 
EOF
