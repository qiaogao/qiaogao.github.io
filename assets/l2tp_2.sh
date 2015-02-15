#!/bin/sh
 
 
 
#VPN 账号
vpn_name="gqplus2"
 
#VPN 密码
vpn_password="pqlic31"
 
#设置 PSK 预共享密钥
psk_password="gqplus2"
 
#获取公网IP
ip=`ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
if [ ! -n "$ip" ]; then
    ip=`ifconfig | grep 'inet' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2}'`
fi
 
 
yum install -y ppp iptables make gcc gmp-devel xmlto bison flex xmlto libpcap-devel lsof screen
 
#安装openswan
if [ ! -f "./openswan.tar.gz" ]; then
    wget -c -O openswan.tar.gz http://www.openswan.org/download/openswan-2.6.33.tar.gz
fi
tar -zxvf openswan.tar.gz
cd ./openswan*/
make programs install
 
 
#备份 /etc/ipsec.conf 文件
ipsec_conf="/etc/ipsec.conf"
if [ -f $ipsec_conf ]; then
    cp $ipsec_conf $ipsec_conf.bak
fi
echo "
version 2.0
config setup
    nat_traversal=yes
    virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12
    oe=off
    protostack=netkey
 
conn L2TP-PSK-NAT
    rightsubnet=vhost:%priv
    also=L2TP-PSK-noNAT
 
conn L2TP-PSK-noNAT
    authby=secret
    pfs=no
    auto=add
    keyingtries=3
    rekey=no
    ikelifetime=8h
    keylife=1h
    type=transport
    left=$ip
    leftprotoport=17/1701
    right=%any
    rightprotoport=17/%any
    dpddelay=40
    dpdtimeout=130
    dpdaction=clear
" > $ipsec_conf
 
 
 
#备份 /etc/ipsec.secrets 文件
ipsec_secrets="/etc/ipsec.secrets"
if [ -f $ipsec_secrets ]; then
    cp $ipsec_secrets $ipsec_secrets.bak
fi
echo "
$ip   %any:  PSK \"$psk_password\"
" >> $ipsec_secrets
 
 
 
#备份 /etc/sysctl.conf 文件
sysctl_conf="/etc/sysctl.conf"
if [ -f $sysctl_conf ]; then
    cp $sysctl_conf $sysctl_conf.bak
fi
 
 
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
sysctl -p
iptables --table nat --append POSTROUTING --jump MASQUERADE
for each in /proc/sys/net/ipv4/conf/*
do
    echo 0 > $each/accept_redirects
    echo 0 > $each/send_redirects
done
 
/etc/init.d/ipsec restart
 
 
#安装rp-l2tp
cd ~
if [ ! -f "./rp-l2tp.tar.gz" ]; then
    wget -c -O rp-l2tp.tar.gz http://mirror.vpseek.com/sources/rp-l2tp-0.4.tar.gz
fi
tar -zxvf rp-l2tp.tar.gz
cd ./rp-l2tp*/
./configure
make
cp handlers/l2tp-control /usr/local/sbin/
mkdir -p /var/run/xl2tpd/
ln -s /usr/local/sbin/l2tp-control /var/run/xl2tpd/l2tp-control
#安装xl2tpd
cd ~
if [ ! -f "./xl2tpd.tar.gz" ]; then
    wget -c -O xl2tpd.tar.gz http://mirror.vpseek.com/sources/xl2tpd-1.2.4.tar.gz
fi
tar -zxvf xl2tpd.tar.gz
cd ./xl2tpd*/
make install
 
 
 
mkdir -p /etc/xl2tpd
xl2tpd="/etc/xl2tpd/xl2tpd.conf"
if [ -f $xl2tpd ]; then
    cp $xl2tpd $xl2tpd.bak
fi
echo "
[global]
ipsec saref = yes
 
[lns default]
ip range = 10.1.2.2-10.1.2.255
local ip = 10.1.2.1
refuse chap = yes
refuse pap = yes
require authentication = yes
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd
length bit = yes
" > $xl2tpd
 
 
#设置 ppp
options_xl2tpd="/etc/ppp/options.xl2tpd"
if [ -f $options_xl2tpd ]; then
    cp $options_xl2tpd $options_xl2tpd.bak
fi
echo "
require-mschap-v2
ms-dns 8.8.8.8
ms-dns 8.8.4.4
asyncmap 0
auth
crtscts
lock
hide-password
modem
debug
name l2tpd
proxyarp
lcp-echo-interval 30
lcp-echo-failure 4
" > $options_xl2tpd
 
 
 
#添加 VPN 账号
chap_secrets="/etc/ppp/chap-secrets"
if [ -f $chap_secrets ]; then
    cp $chap_secrets $chap_secrets.bak
fi
echo "
$vpn_name * $vpn_password *
" >> $chap_secrets
 
 
#设置 iptables 的数据包转发
iptables --table nat --append POSTROUTING --jump MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
 
screen -dmS xl2tpd xl2tpd -D
 
ipsec verify
 
echo "###########################################"
echo "##    L2TP VPN SETUP COMPLETE!"
echo "##    VPN IP          :   $ip"
echo "##    VPN USER        :   $vpn_name"
echo "##    VPN PASSWORD    :   $vpn_password"
echo "##    VPN PSK         :   $psk_password"
echo "###########################################"