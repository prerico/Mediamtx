#!/bin/bash

# Actualizar el sistema
sudo apt update -y
sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y build-essential cmake libssl-dev libboost-all-dev pkg-config git

# Descargar mediamtx desde el repositorio de GitHub
git clone https://github.com/bluenviron/mediamtx.git
cd mediamtx

# Crear directorios necesarios
mkdir build
cd build

# Compilar mediamtx
cmake ..
make
sudo make install

# Habilitar RTSP en la configuración
echo "Configurando mediamtx para habilitar RTSP..."

# Copiar el archivo de configuración por defecto
cd ..
cp config.yml.example config.yml

# Editar la configuración para habilitar RTSP
sed -i 's/rtsp: disabled/rtsp: enabled/' config.yml

# Iniciar mediamtx
echo "Iniciando mediamtx..."
./build/mediamtx config.yml

# Información sobre RTSP
echo ""
echo "### Información para emitir en RTSP ###"
echo "Para emitir en RTSP, utilice la siguiente dirección:"
echo "rtsp://<IP_del_servidor>:8554/stream"
echo "Por ejemplo, si la IP de su servidor es 192.168.1.100, la dirección será:"
echo "rtsp://192.168.1.100:8554/stream"
echo ""

echo "Instalación y configuración completadas. Ahora puede emitir en RTSP."
