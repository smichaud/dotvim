# This repository contains all my Vim environment

This repository contains my personal .vim folder.
I currently use Vundle to manage plugins.

To get a list of all the key shortcuts use the :map and :map! commands.
You can output them in a file with:
```
:redir! > vim_maps.txt
:map
:map!
:redir END
```
[Source] (http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29)