PPTP VPN install script for Centos            
==========================
    
**Be sure ppp in your vps is on**

------------------------------
Test if your vps ppp is on, please input following commands:             
>$ cat /dev/ppp
>cat: /dev/ppp: No such device or address           

----------------------------------
**Useage:**
>sh myPPTP.sh \$eth0 \$username \$passwd
        
\$eth0 is nwtwork card name    
\$username is vpn account username
\$passwd is vpn account password
