config your vim from me
==============

Step 1
--------------
```shell
cd ~ && git clone https://github.com/wyying/.vim.git
```

Step 2
--------------
```shell
cat >> /etc/vim/vimrc <<EOF
source ~/.vim/vimrc 
EOF
```

Step 3
--------------
```shell
vim temp.txt
```

And then, type command below in the vim:
```shell
:PluginInstall!
```

Step 4
--------------
So easy! Rock your vim, now!!!


