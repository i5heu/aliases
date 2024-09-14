# i5heu's Aliases
[Install Aliases](#install-aliases-1)  
[Legend](#Legend)


## Aliases

### Kubernetes and Docker 
- **m8** - Starting MicroK8s
- **m8dp** - Accessing the MicroK8s dashboard proxy
- **k** - MicroK8s kubectl command
- **kubectl** - kubectl command linked to MicroK8s
- **recomp** - Down and up Docker Compose, remove orphans, and follow logs
- **install_microk8** - Install MicroK8s by running the install script
- **docker_compose_down_up_logs** - Function to handle Docker Compose commands: down, up, and logs

### Filesystem 
- **lh** - Listing all files with human-readable sizes
- **dud** - Display the size of all folders in the current directory, sorted by size
- **showContents** - Display all file contents in the current directory recursively
- **tazstd** - Function to tar and compress a directory with ZSTD
- **mkdid** - Function to create directories recursively and navigate to the deepest directory

### System Administration 
- **up** - Update, upgrade, dis-upgrade, and autoremove packages
- **install_default** - Install default packages: docker.io, docker-compose-v2, htop, iftop

### Aliases (this script) Related 
- **laa** - Alias for listAliases script
- **listAliases** - List all available aliases and functions with their descriptions   
Options:
   - **-v** will show the aliases file
   - **-m** will print in markdown format
- **aliasup** - Update the aliases collection on your system

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
