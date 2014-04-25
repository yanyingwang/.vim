conf_vim
=====

Step 1
--------------
```shell
ln -sf /home/wyy/conf_vim /root/.vim
ln -sf /home/wyy/conf_vim /home/wyy/.vim

cat >> /etc/vim/vimrc <<EOF
source /home/wyy/conf_vim/vimrc 
EOF
```

Step 2
--------------
```shell
vim temp.txt
```

And then, type command below in the vim:

```shell
:BundleInstall
```

Step 3
--------------
So easy! Rock your vim, now!!!


