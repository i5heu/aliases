#!/bin/bash

# Update packages and upgrade the system
sudo apt update
sudo apt full-upgrade -y

# Check if microk8s is already installed and install it if not
if snap list microk8s 1>/dev/null 2>&1; then
    echo "microk8s is already installed... removing"
    sudo snap remove microk8s
fi

sudo mkdir -p /var/snap/microk8s/common/
sudo cp $HOME/.aliases/microk8s_config.yaml /var/snap/microk8s/common/.microk8s.yaml

sudo snap install microk8s --classic

# Add the current user to the microk8s group and change ownership of .kube directory
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER:$USER ~/.kube

# Ensure microk8s is ready and enable necessary services
sudo -u $USER microk8s status --wait-ready
sudo -u $USER microk8s enable dns ingress

# Execute kubectl command to check resources
sudo -u $USER microk8s kubectl get all --all-namespaces
