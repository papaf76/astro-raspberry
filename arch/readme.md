# Personalizzazione Raspberry per astronomia su Arch linux

## YAY
```
bash -c 'sudo pacman -S --needed git base-devel; \
git clone https://aur.archlinux.org/yay.git; \
cd yay; \
makepkg -si; \
cd ~; rm -rf yay'
```

Installare:
- openssh
- novnc (aur via yay)
- python-numpy
- tigervnc
- mate ttf-dejavu noto-fonts ttf-liberation mate-terminal
- materia-gtk-theme
- networkmanager
- caddy
- cockpit
- msmtp
- kstars (flatpak, da grafica?)

## NetworkManager
Definire la connessione via lan come shared con indirizzo 10.0.0.1/24

Copiare lo script dispatcher in /etc/NetworkManager/dispatcher.d con permessi di esecuzione

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

Editare l'override per il servizio vncserver per abilitare l'autorestart:

systemctl edit vncserver@:0
```
[Service]
Restart=always
RestartSec=1

[Unit]
StartLimitIntervalSec=5
StartLimitBurst=5
```

Attivare il servizio:
```
systemctl enable --now novnc
systemctl enable --now vncserver@:0
```

## Cockpit
Copiare cockpit.conf in /etc/cockpit

## Email
Copiare msmtprc in /etc

## Desktop
- Rimuovere la barra sopra
- Fare quella sotto grande (24px) e autohide
- Impostare yaru dark red come tema
- Disattivare screensaver ??

## Installazione Kstars flatpak
Da shell come utente:
```
yay -S fxload
sudo pacman -S flatpak wget
wget https://raw.githubusercontent.com/ikarustechnologies/indi-firmware/main/kstars.sh
```
Da grafica, aprire un terminale e digitare:
```
bash kstars.sh
```
