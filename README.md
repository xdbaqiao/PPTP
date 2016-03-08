PPTP VPN install script for Centos            
==========================
    
**Be sure ppp in your vps is on**

------------------------------
Test if your vps ppp is on, please input following commands:             
>$ cat /dev/ppp             
>cat: /dev/ppp: No such device or address           

**Useage:**
>sh myPPTP.sh $eth0 $username $passwd
        
$eth0 is nwtwork card name    
$username is vpn account username       
$passwd is vpn account password


PPTP VPN centos 搭建脚本
==========================
    
**确保ppp是打开的状态**

------------------------------
使用下面的命令测试
>$ cat /dev/ppp             
>cat: /dev/ppp: No such device or address           

**脚本使用方法:**
>sh myPPTP.sh \$eth0 \$username \$passwd
        
$eth0 指定流量转发网卡名称                 
$username VPN用户名                
$passwd VPN密码            



-------------------------
Please enjoy!

