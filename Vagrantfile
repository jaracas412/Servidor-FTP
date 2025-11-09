# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Imagen base que usará la máquina virtual
  config.vm.box = "debian/bullseye64"

  # Configuración de red pública y acceso desde el host
  # Redirige el puerto 80 de la VM al 8080 del equipo anfitrión
  config.vm.network "forwarded_port", guest: 80, host: 8080 


  # Script de aprovisionamiento
  # Se ejecuta al crear la VM para instalar y preparar el servidor DNS
  config.vm.provision "shell", path: "bootstrap.sh"



  # Red privada
  # Dirección IP fija asignada al servidor DNS dentro de la red local de Vagrant
  config.vm.network "private_network", ip: "192.168.41.43"

  # Nombre asignado a la máquina virtual
  config.vm.hostname = "jose-server"




  # Carpeta compartida entre el host y la VM
  config.vm.synced_folder ".", "/vagrant"

end
