# i5heu's Aliases
[Install Aliases](#Install_Aliases)  
[Legend](#Legend)


## Aliases
- `up` 👑 Will update, upgrade, dis-upgrade and autoremove
- `dud` Will show the size of all folders in the current directory, sorted by size
- `mkdid` Will create folder of path given recursivly and then enter the deepest folder
- `lh` Will print list all files with human readable size
- `tazstd` Will tar a given directory and compress it with ZSTD
- `recomp` Will down and up docker compose, will remove orphans, will show then logs which you can Strg+C without taking the deployment down
- `aliasup` Will update and apply this aliases collection to your system, current and future sessions

### Kubernetes
- `k` Alias for `microk8s kubectl` - the kubectl of microk8s
- `m8` Alias for `microk8s`
- `m8dp` Alias for `microk8s dashboard-proxy`

### Install Aliases
- `intsall_default` 👑 Will install `docker.io docker-compose-v2 htop iftop`
- `install_microk8` 👑 Will install MicroK8 - will call sudo

### Legend
- 👑 will call sudo

## Install Aliases
Go to homefolder and run this
```bash
git clone https://github.com/i5heu/aliases.git ~/.aliases && bash ~/.aliases/setup.sh && source ~/.aliases/aliases
```

To update use
```base
aliasup
```
