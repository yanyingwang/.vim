Config your vim from mine:
==============

Step 1
--------------
```shell
aptitude install -y exuberant-ctags
```

Step 2
--------------
```shell
cd ~ && git clone https://github.com/wyying/.vim.git
```

Step 3
--------------
```shell
vim temp.txt
```

If nothing happen, type command below in the vim:
```shell
:NeoBundleInstall!
```
* NeoBundleList - list configured bundles
* NeoBundleInstall(!) - install (update) bundles
* NeoBundleClean(!) - confirm (or auto-approve) removal of unused bundles

Step 4
--------------
So easy! Rock your vim, now!!!


