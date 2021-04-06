#!/usr/bin/env bash
sudo cp /etc/apt/sources.list "/etc/apt/sources.list-$(date +%Y%m%d%H%M%S)"
sudo sed -i 's#cn.ports.ubuntu.com#mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list
sudo apt update