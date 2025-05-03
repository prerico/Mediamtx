#!/bin/bash

# Variables
MEDIAMTX_VERSION="latest"
INSTALL_DIR="/usr/local/bin"
CONFIG_FILE="/etc/mediamtx.yml"
SERVICE_FILE="/etc/systemd/system/mediamtx.service"

# Instalar dependencias
sudo apt update && sudo apt install -y wget tar

# Descargar última versión de mediamtx
echo "Descargando mediamtx..."
cd /tmp
wget https://github.com/bluenviron/mediamtx/releases/$MEDIAMTX_VERSION/download/mediamtx_linux_amd64.tar.gz -O mediamtx.tar.gz
tar -xzf mediamtx.tar.gz

# Mover ejecutable
sudo mv mediamtx $INSTALL_DIR
sudo chmod +x $INSTALL_DIR/mediamtx

# Crear archivo de configuración básico habilitando RTSP
echo "Creando archivo de configuración..."
sudo tee $CONFIG_FILE > /dev/null <<EOF
rtsp:
  enabled: yes
EOF

# Crear servicio systemd
echo "Creando servicio systemd..."
sudo tee $SERVICE_FILE > /dev/null <<EOF
[Unit]
Description=mediamtx RTSP Server
After=network.target

[Service]
ExecStart=$INSTALL_DIR/mediamtx $CONFIG_FILE
Restart=always
User=root
WorkingDirectory=$INSTALL_DIR

[Install]
WantedBy=multi-user.target
EOF

# Recargar systemd y habilitar servicio
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable mediamtx
sudo systemctl start mediamtx

# Mostrar información de RTSP
IP=$(hostname -I | awk '{print $1}')
echo "Instalación completa."
echo "Puedes emitir en RTSP a esta dirección:"
echo "  rtsp://$IP:8554/mystream"
