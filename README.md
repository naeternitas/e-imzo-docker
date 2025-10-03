# E-IMZO в Docker
Docker-обёртка для запуска модуля E-IMZO в Linux.
## Check
Проверено на:
Nixos 25.05
Rocky Linux 9/Alma Linux 9
Ubuntu 24.04

## Prepare
🐧 Ubuntu / Debian
```
sudo apt update
sudo apt install -y x11-xserver-utils
```
🐧 Fedora / RHEL / CentOS / Rocky
```
sudo dnf install -y xorg-x11-server-utils
```
(в старых CentOS 7 может быть пакет xorg-x11-utils)
🐧 Arch Linux / Manjaro
```
sudo pacman -S xorg-xhost
```
## Run
```bash
git clone https://github.com/naeternitas/e-imzo-docker.git
cd e-imzo-docker
sudo xhost +local:docker
sudo docker compose up -d --build
```
## Use
после запуска будет создан каталог ./DSKEYS в него нужно поместить файл DS*.pfx
Так же нужно импортировать сертификат e-imzo или пройти по пути https://127.0.0.1:64443/ и принять самоподписанный сертификат.
### Bugs
Не найдена возможность скрытия иконки трея, постоянно отображается как отдельное окно.
