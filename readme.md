# Censurameste

## Descripción

Script diseñado para configurar los servidores DNS de Google en distribuciones Linux. Está pensado especialmente para aquellos que buscan mejorar su privacidad y seguridad en línea, asegurando que su dispositivo utilice servidores DNS confiables. 

Este proyecto es particularmente útil para usuarios en países donde la censura y el bloqueo de contenidos son comunes. Al usar los DNS de Google, puedes evitar restricciones impuestas por proveedores de servicios de Internet (ISP).

## Características

- Compatibilidad con Múltiples Distribuciones: El script detecta y utiliza las herramientas disponibles en el sistema (systemd-resolved, NetworkManager, o modifica /etc/resolv.conf directamente) para asegurar que la configuración de DNS sea efectiva y persistente.
- Desatendido: El script está diseñado para ser lo más automatizado posible, requiriendo poca o ninguna intervención del usuario después de su ejecución.
- Eficaz: Configura los DNS de Google (8.8.8.8 y 8.8.4.4) para todas las interfaces de red activas.

## ¿A quién va dirigido?

Este script está dirigido a:

- Usuarios de Linux que desean evitar la censura y el bloqueo de contenido.
- Cualquier persona que busque una manera sencilla de configurar servidores DNS confiables en su dispositivo Linux.
- Aquellos que buscan mejorar su privacidad y seguridad en línea.

## Requisitos del Sistema

- Privilegios de superusuario (root): Necesarios para aplicar los cambios en la configuración de red.
- Distribución de Linux: Este script es compatible con la mayoría de las distribuciones modernas que utilizan systemd, NetworkManager, o resolv.conf para la gestión de DNS.

## Instrucciones de Uso

### 1. Descargar y Guardar el Script

Descarga el archivo censurameste.sh desde el repositorio y guárdalo en cualquier directorio de tu elección.

### 2. Hacer el Script Ejecutable

Abre una terminal y navega hasta el directorio donde guardaste el script. Luego, hazlo ejecutable con el siguiente comando:

bash
`chmod +x censurameste.sh`

### 3. Ejecutar el Script
Para ejecutar el script, necesitas privilegios de superusuario. Ejecuta el siguiente comando en la terminal:

bash
`sudo ./censurameste.sh`

### 4. Verificar la Configuración
Después de ejecutar el script, puedes verificar que los DNS se han configurado correctamente con uno de los siguientes comandos:

- Para sistemas con NetworkManager:

bash
`nmcli dev show | grep DNS`

- Para ver los DNS en /etc/resolv.conf:

bash
`cat /etc/resolv.conf`

- Para verificar el estado de systemd-resolved:

bash
`systemctl status systemd-resolved`

## Notas Importantes
Este script está diseñado para ser lo más compatible posible, pero en sistemas con configuraciones de red muy personalizadas, algunos pasos pueden requerir ajustes adicionales.
Aunque el script intenta asegurar la persistencia de los cambios, algunas configuraciones de red pueden sobrescribir los DNS después de reiniciar o cambiar de red.