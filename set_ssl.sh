#!/usr/bin/env bash

# 为 ESXi 添加 ssl 证书

# 1. 备份默认证书
cd /etc/vmware/ssl
mv rui.crt rui.crt.bak && mv rui.key rui.key.bak

# 2.阿里云申请证书，下载 Nginx 类型的文件并上传到 datastore

# 3.将下载的证书命名，放到 /etc/vmware/ssl 下
cd /vmfs/volumes/datastore1
#unzip your.zip
#mv your.pem rui.crt
#mv your.key rui.key
mv rui.crt /etc/vmware/ssl/rui.crt && mv rui.key /etc/vmware/ssl/rui.key

# 4. 重启服务
/etc/init.d/hostd restart
/etc/init.d/vpxa restart
