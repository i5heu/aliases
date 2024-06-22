# My Aliases

Look here for [Install](#Install)

## Aliases
- `dud` Will show the size of all folders in the current directory, sorted by size
- `up`  Will update, upgrade, dis-upgrade and autoremove - will call sudo
- `lh`  Will print list all files with human readable size
- `tazstd` Will tar a given directory and compress it with ZSTD
- `recomp` Will down and up docker compose, will remove orphans, will show then logs which you can Strg+C without taking the deployment down

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
