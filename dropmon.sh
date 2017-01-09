#!/usr/bin
if [ $1 ];then
port_dropbear=$1
log=/var/log/auth.log
loginsukses='Password auth succeeded'
echo ' '
echo ' '
echo "               Dropbear Users Login Monitor "
echo "---------------------------------------------------------------"
echo "  Date-time    |  PID      |  User Name      |  From Host " 
echo "---------------------------------------------------------------" 
pids=`ps ax |grep dropbear |grep  " $port_dropbear" |awk -F" " '{print $1}'`
for pid in $pids 
do
    pidlogs=`grep $pid $log |grep "$loginsukses" |awk -F" " '{print $3}'`
    i=0
    for pidend in $pidlogs
    do
      let i=i+1
    done   
    if [ $pidend ];then
       login=`grep $pid $log |grep "$pidend" |grep "$loginsukses"`
       PID=$pid
       user=`echo $login |awk -F" " '{print $10}' | sed -r "s/'/ /g"`
       time=`echo $login |awk -F" " '{print $2,$3}'`
       while [ ${#time} -lt 13 ]
       do
           time=$time" " 
       done

       while [ ${#user} -lt 16 ]
       do
           user=$user" " 
       done
       while [ ${#PID} -lt 8 ]
       do
           PID=$PID" " 
       done

       fromip=`echo $login |awk -F" " '{print $12}' |awk -F":" '{print $1}'`
       echo "  $time|  $PID | $user|  $fromip "
    fi
done
echo "---------------------------------------------------------------" 
else
echo "  Use the command ./dropmon.sh [port]"
echo "  example : ./dropmon.sh 443"
echo \n
echo \n
fi
exit 0

