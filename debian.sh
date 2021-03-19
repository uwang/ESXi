cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak

cat>/etc/apt/sources.list<<EOF
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb http://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
EOF

cat>/etc/apt/sources.list.d/raspi.list<<EOF
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
EOF

apt update
apt install apt-transport-https ca-certificates -y

# 切换到 https 源
sed -i 's/http/https/g' /etc/apt/sources.list
sed -i 's/http/https/g' /etc/apt/sources.list.d/raspi.list
apt update

apt-get clean
apt install -y linux-image-arm64

apt-get clean
apt install -y grub-efi-arm64
grub-install --efi-directory=/boot
update-grub
