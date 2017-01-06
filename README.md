# Script para auto instalação de VPS Seller para Debian/Ubuntu

===========================
# Serviços
-------  
OpenVPN  : TCP 1194 (client config : http://IPVPS:81/client.tar)  
OpenSSH : 22, 143  
Dropbear : 443  
Squid3 : 8080, 80 (limit to IP VPS)  
Badvpn : badvpn-udpgw port 7300  
Nginx : 81  
  
# Tools  
-----  
axel  
bmon  
htop  
iftop  
mtr  
rkhunter  
nethogs: nethogs venet0  
  
# Script  
------  
screenfetch  
./ps_mem.py  
./speedtest_cli.py --share  
./bench-network.sh  
./userlogin.sh (Melihat user openssh & dropbear yang login)  
./userexpired.sh (Lock password user expired)  
./userlimit.sh 2 (Melimit max 2 login)  
./expire.sh (Melihat tanggal expired user)  
sh dropmon [port] contoh: sh dropmon 443  

# Fitur lain  
----------  
Webmin   : https://IPVPS:10000/  
Vnstat   : http://IPVPS:81/vnstat/  
MRTG     : http://IPVPS:81/mrtg/  
Timezone : Asia/Jakarta  
Fail2Ban : [on]  
IPv6     : [off]  
VPS Akan Reboot Tiap 6 Jam Sekali  

===========================

# baseado em 2 projetos
https://github.com/evandro5/utnubu
e
https://github.com/yurisshOS/debian7os

todos os créditos de criação são de seus respectivos autores
