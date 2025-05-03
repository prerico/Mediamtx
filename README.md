
# Instalación de mediamtx (RTSP) con Autoinicio como Servicio

Este repositorio contiene un script (`Mediamtxtak.sh`) que instala y configura automáticamente **mediamtx**, habilitando RTSP y creando un servicio `systemd` para que se inicie automáticamente al arrancar el sistema.

---

## Requisitos

- Sistema operativo basado en Linux (Ubuntu/Debian recomendado)
- Acceso a Internet
- Permisos de superusuario (`sudo`)
- Git instalado

---

## Instrucciones de instalación

1. Abre una terminal en tu servidor Linux.
2. Clona este repositorio:

   ```bash
   git clone https://github.com/prerico/Mediamtx.git
   ```

3. Entra al directorio:

   ```bash
   cd Mediamtx
   ```

4. Da permisos de ejecución al script:

   ```bash
   chmod +x Mediamtxtak.sh
   ```

5. Ejecuta el script:

   ```bash
   ./Mediamtxtak.sh
   ```

6. Al finalizar verás la dirección RTSP para emitir, como:

   ```
   rtsp://TU_IP_LOCAL:8554/mystream
   ```

---

## Servicio systemd

El script crea un servicio llamado `mediamtx` para que el servidor RTSP arranque automáticamente.

Puedes controlarlo con:

```bash
sudo systemctl start mediamtx      # Inicia el servicio
sudo systemctl stop mediamtx       # Detiene el servicio
sudo systemctl status mediamtx     # Muestra el estado
sudo systemctl restart mediamtx    # Reinicia el servicio
```

---

## Problemas comunes

**1. Error al clonar el repositorio**  
*Solución:* Verifica tu conexión a Internet y que tengas `git` instalado (`sudo apt install git`).

**2. No se encuentra el comando `wget` o `tar`**  
*Solución:* Asegúrate de tenerlos instalados:  
```bash
sudo apt install wget tar
```

**3. No puedes acceder al RTSP desde otro dispositivo**  
*Solución:* Comprueba que el puerto `8554` no está bloqueado por el firewall.

---

## Archivo PDF de ayuda

Puedes consultar la guía completa en PDF aquí:  
[Guía de instalación de mediamtx (RTSP)](https://github.com/prerico/Mediamtx/releases/latest/download/Guia_instalacion_mediamtx.pdf)
