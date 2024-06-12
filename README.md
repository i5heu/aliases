# My Aliases

Look here for [Install](#Install)

## Aliases
- `dud` Will show the size of all folders in the current directory, sorted by size
- `up`  Will update, upgrade, dis-upgrade and autoremove - will call sudo

## Install
Go to homefolder and run this
```bash
git clone https://github.com/i5heu/aliases.git ~/.aliases
```
Now run 
```bash
sh ~/.aliases/setup.sh && source ~/.aliases/aliases
```

To update use (copy with parenthesize)
```base
( cd ~/.aliases && git pull ) && source ~/.aliases/aliases 
```
