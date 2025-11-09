#!/bin/bash
# Indica que el script se ejecuta con Bash

set -e
# Detiene el script si cualquier comando falla

# Mensaje indicando que se van a actualizar paquetes e instalar BIND9
echo "Actualizando paquetes e instalando BIND9..."

# Actualiza la lista de paquetes disponibles
sudo apt-get update -y

# Instala BIND9, sus utilidades y documentación sin pedir confirmación
sudo apt-get install -y bind9 bind9utils bind9-doc

# Mensaje indicando que se van a copiar los archivos de configuración
echo "Copiando ficheros de configuración..."

# Copia configuración DNS a directorio de BIND.
sudo cp /vagrant/config/named.conf.options /etc/bind/named.conf.options

# Copia la configuración del servicio BIND
sudo cp /vagrant/config/named /etc/default/named

# Copia la configuración local de las zonas DNS
sudo cp /vagrant/config/named.conf.local /etc/bind/named.conf.local

# Copia la zona directa de "jose.test"
sudo cp /vagrant/config/jose.test.dns /var/lib/bind/jose.test.dns

# Copia la zona inversa de "jose.test"
sudo cp /vagrant/config/jose.test.rev /var/lib/bind/jose.test.rev

# Mensaje indicando que se va a verificar la sintaxis de BIND
echo "Verificando sintaxis de BIND..."

# Verifica que la configuración general de BIND sea válida
sudo named-checkconf

# Comprueba que la zona directa "jose.test" esté correcta
sudo named-checkzone jose.test /var/lib/bind/jose.test.dns

# Comprueba que la zona inversa esté correcta
sudo named-checkzone 2.168.192.in-addr.arpa /var/lib/bind/jose.test.rev

# Mensaje indicando que se va a reiniciar BIND9
echo "Reiniciando BIND9..."

# Reinicia el servicio BIND9 para aplicar la nueva configuración
sudo systemctl restart bind9

# Mensaje final indicando que el provisionamiento ha finalizado
echo "Provisionamiento completado"

