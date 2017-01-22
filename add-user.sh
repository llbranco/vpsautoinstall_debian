#!/bin/bash
echo "-----------------------------------"
echo "  REGISTRO DE USUARIO  "
echo "-----------------------------------"
echo -n "Username: "
read acc
echo -n "Senha: "
read pass
echo -n "Validade em dias: "
read exp
IP=`ifconfig eth0| awk 'NR==2 {print $2}'| awk -F: '{print $2}'`
useradd -e `date -d "$exp days" +"%Y-%m-%d"` -s /bin/false -M -g clients $acc
echo -e "$pass\n$pass\n"|passwd $acc &> /dev/null
echo "-----------------------------------------------------"
echo "         SUCESSO           "
echo "-----------------------------------------------------"
echo -e "Username: $acc "
echo -e "Senha: $pass"
echo -e "Válido por: $exp dias"
echo -e "IP: $IP "
echo -e "PortaSSH: 443 "
echo -e "PortaSquid: 80 "
echo "-----------------------------------------------------"
