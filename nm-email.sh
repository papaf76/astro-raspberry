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

/usr/local/bin/cloudflare_update.sh $IP rasplocal.papaf.org

cat > /var/www/index.html <<- EOF
<head>
  <meta http-equiv='refresh' content='0; URL=winscp-sftp://papaf:PASSWORD_HERE$IP/home/papaf/'>
</head>
EOF

cat > /tmp/email.txt <<- EOF
To: papaf76@gmail.com
From: AstroArch <astroarch@papaf.org>
Subject: Indirizzo IP AstroArch
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8

<html>
<h1>Indirizzo IP $HOSTNAME $IP</h1>
<a href='https://$IP'>VNC Viewer</a><br>
<a href='https://$IP/cockpit/'>Cockpit</a><br>
<a href='https://$IP/winscp/'>WinSCP</a><br>
</html>
EOF

msmtp --account smtp2go --read-recipients < /tmp/email.txt

exit 0
