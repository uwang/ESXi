#!/usr/bin/env bash
#!/usr/bin/env bash

apt install apt-transport-https ca-certificates -y

cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak

cat>/etc/apt/sources.list<<EOF
deb https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian buster main contrib non-free
deb https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian buster-updates main contrib non-free
deb https://mirrors.ustc.edu.cn/debian-security buster/updates main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian-security/ buster/updates main non-free contrib
EOF

cat>/etc/apt/sources.list.d/raspi.list<<EOF
deb http://mirrors.ustc.edu.cn/archive.raspberrypi.org/debian/ buster main ui
#deb-src http://mirrors.ustc.edu.cn/archive.raspberrypi.org/debian/ buster main ui
EOF

apt-get update
