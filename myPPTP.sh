#!/bin/bash
#sh myPPTP.sh $eth0 $username $passwd
# NOTICE: $eth0 is nwtwork card name, $username is vpn account username, $passwd is vpn account password

if [ $# != 3 ];then
    echo "Parameters number error!"
    return
fi

eth0=$1
username=$2
passwd=$3

# install ppp
yum -y install ppp 

# install pptpd
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/pptpd-1.4.0-3.el6.x86_64.rpm
rpm -ivh pptpd-1.4.0-3.el6.x86_64.rpm

# edit file /etc/sysctl.conf, make net.ipv4.ip_forward = 1
sed -i "s#net.ipv4.ip_forward = 0#net.ipv4.ip_forward = 1#" /etc/sysctl.conf

# iptables configuration
# NOTICE: change network card name
sysctl -p
echo "localip 192.168.240.1" >> /etc/pptpd.conf
echo "remoteip 192.168.240.101-200" >> /etc/pptpd.conf
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd
iptables --flush POSTROUTING --table nat
iptables --flush FORWARD
iptables -A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
iptables -A INPUT -p gre -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.240.0/24 -o ${eth0} -j MASQUERADE
service iptables save
service pptpd restart
service iptables restart
chkconfig pptpd on
chkconfig iptables on

# add your vpn account
echo ${username}' pptpd '${passwd} ' *' >> /etc/ppp/chap-secrets
