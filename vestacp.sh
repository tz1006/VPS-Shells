#!/bin/sh

# yum -y update

# 设定变量 
HOSTNAME="`hostname --fqdn`"
EMAIL="v@omg.tf"
PASSWORD="ztang15"

# 安装vestacp
curl -O http://vestacp.com/pub/vst-install.sh
yum -y install expect
echo "#!/usr/bin/expect
spawn bash vst-install.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban no --quota no --exim yes --dovecot yes --spamassassin yes --clamav no --mysql yes --postgresql no --hostname $HOSTNAME --email $EMAIL --password $PASSWORD 
sleep 10
expect \"continue\"
send \"y\r\"
expect \"Congratulations\"
interact
#  expect eof
#  exit
"> /root/vestacp.expect
expect /root/vestacp.expect
rm -f /root/vestacp.expect
