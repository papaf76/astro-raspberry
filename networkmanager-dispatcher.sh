#!/bin/bash
interface=$1
event=$2

if [[ $interface != "wlan0" ]] || [[ $event != "up" ]]
then
  exit 0
fi

export LC_ALL=C
export LANG=C
IP=$(ip address show wlan0 | grep inet | grep -v inet6 | cut -d " " -f 6 | cut -d "/" -f 1)

cat > /var/www/index.html <<- EOF
<head>
  <meta http-equiv='refresh' content='0; URL=winscp-sftp://papaf:PASSWORD_HERE$IP/home/papaf/'>
</head>
EOF

cat > /tmp/email.txt <<- EOF
<html>
<h1>Indirizzo IP $HOSTNAME $IP</h1>
<a href='https://$IP'>VNC Viewer</a><br>
<a href='https://$IP/cockpit/'>Cockpit</a><br>
<a href='https://$IP/winscp/'>WinSCP</a><br>
</html>
EOF

sendEmail \
  -f "Raspberry di Fabio <raspfabio@papaf.org>" -t papaf76@gmail.com \
  -u "Indirizzo IP Raspberry" -o message-file=/tmp/email.txt \
  -s mail.smtp2go.com:587 -xu papaf.org -xp njkkGOWgf0flurIJ

#Google
#  -s smtp.gmail.com:587 -xu papaf76@gmail.com -xp "rwplwrkwesuxjdro" -o tls=yes

exit 0
