# Personalizzazione Raspberry per astronomia su Arch linux

Installare:
- novnc (aur via yay)
- tigervnc
- mate ttf-dejavu noto-fonts ttf-liberation mate-terminal
- networkmanager
- caddy
- cockpit
- sendemail (aur via yay)
- kstars (flatpak, da grafica?)

## NetworkManager
Definire la connessione via lan come shared con indirizzo 10.0.0.1/24

## Caddy
Copiare sia Caddyfile che i due files .pem in /etc/caddy
Creare /var/www e assicurarsi che l'utente caddy possa accedere in rwx:
```
mkdir /var/www
chown caddy /var/www
```

## Display remoto tramite VNC
Copiare il file .service in /etc/systemd/system
Copiare config in ~/.config/tigervnc (da creare)
Aggiungere la riga seguente a /etc/tigervnc/vncserver.users
```
:0=papaf
```

## Cockpit
Copiare cockpit.conf in /etc/cockpit
