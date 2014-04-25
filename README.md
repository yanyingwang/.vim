conf_vim
==============

Step 1
--------------
```shell
cd ~ && git clone https://github.com/wyying/conf_vim.git
```

Step 2
--------------
```shell
ln -sf conf_vim /root/.vim
ln -sf conf_vim ~/.vim

cat >> /etc/vim/vimrc <<EOF
source ~/conf_vim/vimrc 
EOF
```

Step 3
--------------
```shell
vim temp.txt
```

And then, type command below in the vim:

```shell
:BundleInstall
```

Step 4
--------------
So easy! Rock your vim, now!!!


