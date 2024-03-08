#!/bin/bash

# Symbolic linking
ln -sf "$(pwd)/.config/nvim" /home/$USER/.config/nvim
ln -sf "$(pwd)/.config/tmux/.tmux.conf" /home/$USER/.tmux.conf
ln -sf "$(pwd)/.bashrc" /home/$USER/.bashrc
ln -sf "$(pwd)/.config/alacritty" /home/$USER/.config/alacritty
ln -sf "$(pwd)/.config/i3" /home/$USER/.config/i3
ln -sf "$(pwd)/.profile" /home/$USER/.profile

sudo usermod -aG video $USER

# Writing Xorg configuration files
sudo tee /etc/X11/xorg.conf.d/90-touchpad.conf > /dev/null <<EOF
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "true"
        Option "TappingButtonMap" "lrm" # 1/2/3 finger, for 3-finger middle lrm
EndSection
EOF

sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null <<EOF
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "qwerty"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF

# Update and install packages
sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y \
    i3 \
    tmux \
    pavucontrol \
    git \
    xclip \
    brightnessctl \
    arandr \
    figlet \
    mpv \
    lxappearance \
    sxiv \
    build-essential \
    unclutter \
    net-tools \
    dnsutils \
    tcpdump \
    ripgrep \
    ssh \
    unifont \
    libxft2-dev

# Install Node.js and dependencies
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    npm install -g yarn

# Install Helm
curl -LO https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.8.2-linux-amd64.tar.gz && \
    sudo mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf helm-v3.8.2-linux-amd64.tar.gz linux-amd64 && \
    curl -LO https://github.com/roboll/helmfile/releases/download/v0.144.0/helmfile_linux_amd64 && \
    sudo mv helmfile_linux_amd64 /usr/local/bin/helmfile && \
    chmod +x /usr/local/bin/helmfile

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf awscliv2.zip aws

# Install kubectl
curl -LO "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    sudo mv kubectl /usr/local/bin/kubectl

# Install Go
test -d /usr/local/go && rm -rf /usr/local/go
curl -LO https://go.dev/dl/go1.22.1.linux-amd64.tar.gz && \
    sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz && \
    rm go1.22.1.linux-amd64.tar.gz

# Install Helmfile
curl -LO https://github.com/helmfile/helmfile/releases/download/v0.162.0/helmfile_0.162.0_linux_amd64.tar.gz && \
    tar -xzvf helmfile_0.162.0_linux_amd64.tar.gz && \
    chmod +x helmfile && \
    sudo mv helmfile /usr/local/bin

# Clone Packer.nvim
#git clone --depth 1 https://github.com/wbthomason/packer.nvim /home/$USER/.local/share/nvim/site/pack/packer/start/packer.nvim && \
#    chown -R $USER:$USER /home/$USER/.local/share/nvim
