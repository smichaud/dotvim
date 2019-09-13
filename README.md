# This repository contains all my Vim environment

This repository contains my personal .vim folder.
I currently use Vundle to manage plugins.
```
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
:PluginInstall
```

To get a list of all the key shortcuts use the :map and :map! commands.
You can output them in a file with:
```
:redir! > vim_maps.txt
:map
:map!
:redir END
```
[Source] (http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29)
