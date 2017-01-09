#!/bin/bash
#Script auto create trial user SSH
#which will be expired after 1 day



Login=TNL`</dev/urandom tr -dc X-Z0-9 | head -c4`
days="1"
pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$days days" +"%Y-%m-%d"` $Login
echo -e "$pass\n$pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "==== SUCESSO ===="
echo -e "Porta    : 443 (dropbear)"
echo -e "Username : $Login"
echo -e "Senha: $pass\n"
echo -e "==========================="
echo -e ""
