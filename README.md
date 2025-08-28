# Personalizzazione Raspberry per astronomia

Installare:
. novnc
. tigervnc-standalone-server
. mate-core
. NetworkManager
. caddy (esterno)
. cockpit (esterno)
. kstars (esterno)

## NetworkManager
Definire la connessione via lan come shared con indirizzo 10.0.0.1/24

## Caddy
Copiare sia Caddy file che i due files .pem in /etc/caddy

## Display remoto tramite VNC
Copiare i due files .service in /etc/systemd/system

Copiare novnc_launch.sh in /usr/share/novnc/utils/launch.sh

## Cockpit
Copiare cockpit.conf in /etc/cockpit

## Icona shutdown
Copiare shutdown.desktop in /usr/share/applications
