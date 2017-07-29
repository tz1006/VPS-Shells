#!/bin/sh

# yum -y update
# yum -y install expect
# 设定变量 
HOSTNAME="`hostname --fqdn`"
EMAIL="v@omg.tf"
PASSWORD="ztang15"

# 安装vestacp
# curl -O http://vestacp.com/pub/vst-install.sh
curl -O http://vestacp.com/pub/vst-install-rhel.sh
echo "#!/usr/bin/expect
# spawn bash vst-install.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban no --quota no --exim yes --dovecot yes --spamassassin yes --clamav no --mysql yes --postgresql no --hostname $HOSTNAME --email $EMAIL --password $PASSWORD 
spawn bash vst-install-rhel.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban no --quota no --exim yes --dovecot yes --spamassassin yes --clamav no --mysql yes --postgresql no --hostname $HOSTNAME --email $EMAIL --password $PASSWORD 
sleep 10
expect \"continue\"
send \"y\r\"
sleep 500
"> /root/vestacp.expect
expect /root/vestacp.expect
rm -f /root/vestacp.expect
