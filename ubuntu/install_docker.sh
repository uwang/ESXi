#!/usr/bin/env bash

# 1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# 2. Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 3. Use the following command to set up the stable repository. 
echo \
  "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. 调整为镜像源
sudo sed -i 's+download.docker.com+mirrors.cloud.tencent.com/docker-ce+' /etc/apt/sources.list.d/docker.list


# INSTALL DOCKER ENGINE
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

docker -v

# 使用当前用户运行 docker
sudo usermod -aG docker ${USER}
su - ${USER}
# Confirm that your user is now added to the docker group by typing:
id -nG

# 设置镜像加速器地址
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://ekcfdaer.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# Install Docoker Compose
sudo apt install python3-pip
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
sudo pip3 install docker-compose
docker-compose -v