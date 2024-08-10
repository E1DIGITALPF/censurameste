#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecute este script como root o con sudo."
    exit 1
fi

DNS1="8.8.8.8"
DNS2="8.8.4.4"

if systemctl is-active --quiet systemd-resolved; then
    echo "Configurando DNS usando systemd-resolved..."
    
    sed -i 's/#DNS=/DNS='"$DNS1 $DNS2"'/g' /etc/systemd/resolved.conf
    sed -i 's/#FallbackDNS=/FallbackDNS='"$DNS2"'/g' /etc/systemd/resolved.conf
    
    systemctl restart systemd-resolved
    echo "DNS configurados exitosamente usando systemd-resolved."

elif command -v nmcli &> /dev/null; then
    echo "Configurando DNS usando NetworkManager (nmcli)..."
    
    for connection in $(nmcli -t -f NAME connection show); do
        nmcli connection modify "$connection" ipv4.dns "$DNS1 $DNS2"
        nmcli connection modify "$connection" ipv4.ignore-auto-dns yes
        nmcli connection up "$connection"
    done
    echo "DNS configurados exitosamente usando NetworkManager."

else
    echo "No se encontró systemd-resolved ni NetworkManager."
    echo "Modificando /etc/resolv.conf directamente..."
    
    echo "nameserver $DNS1" > /etc/resolv.conf
    echo "nameserver $DNS2" >> /etc/resolv.conf
    echo "DNS configurados exitosamente modificando /etc/resolv.conf."
fi

echo "Configuración de DNS completada."