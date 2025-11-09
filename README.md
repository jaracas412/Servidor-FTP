# Configuración Inicial del Servidor DNS

## 1. Preparación del entorno
Primero, clonamos nuestro proyecto previo **dns-paso-a-paso** para utilizarlo como base. Esto nos permitirá tener un servidor DNS funcional desde el inicio.

<img width="1560" height="934" alt="1" src="https://github.com/user-attachments/assets/e0ab6474-7109-4ba2-a101-2c88bea4e36f" />

## 2. Ajustes del servidor
A continuación, realizamos las modificaciones necesarias en el servidor. Esto incluye:

- Actualizar las direcciones IP, en mi caso mi nueva IP es 192.168.56.101 (de esta manera no tendremos problemas)
<img width="893" height="389" alt="2 Cambio de IP para evitar problemas" src="https://github.com/user-attachments/assets/03239a9d-730c-49e7-b472-a4368c27571b" />

- Configurar las zonas según los requerimientos.

Todos los archivos que necesitan cambios se encuentran en la carpeta `config`.

No voy a detallar como configurar un servidor DNS ya que lo hicimos en la practica anterior.

## 3. Verificación del funcionamiento
Para asegurarnos de que nuestro servidor DNS está funcionando correctamente, utilizaremos los comandos **dig** y **nslookup**.

### Verificación con dig
Ejecutamos el siguiente comando: **dig @192.168.56.101 debian.jose.test**

Deberíamos obtener un resultado similar al siguiente:

<img width="577" height="326" alt="3 Comprobacion dig" src="https://github.com/user-attachments/assets/ae153d9e-a998-402a-82af-80750eaf5de4" />

Verificación con nslookup

Ejecutamos el siguiente comando: **nslookup debian.jose.test 192.168.56.101**

El resultado esperado sería algo como esto:

<img width="484" height="154" alt="4 Comprobacion nslookup" src="https://github.com/user-attachments/assets/1772cb0b-f289-4c16-8c6c-0d002217eb15" />





# 2. Uso de un Cliente FTP con Interfaz Gráfica (GUI)

En esta sección vamos a instalar y probar un cliente FTP con interfaz gráfica. Para este ejemplo utilizaremos **FileZilla**, aunque puedes emplear cualquier otro.

## Instalación y primera ejecución
El primer paso es descargar FileZilla desde su página oficial e instalarlo. Esto es lo que nos encontraremos una vez abramos el programa por primera vez:

<img width="1237" height="897" alt="Instalar Filezilla" src="https://github.com/user-attachments/assets/0314c516-aa2b-4ec7-b5ad-4bbe4ba6d329" />

## Creación de directorios y archivos
Ahora vamos a crear un directorio de prueba llamado `pruebasFTP` y entrar en él:

<img width="1234" height="320" alt="pruebasftp" src="https://github.com/user-attachments/assets/169bcc25-eb17-4b91-9b7d-9dcd577e2ef8" />

Dentro del directorio, crearemos un archivo de prueba con cualquier contenido que deseemos:

<img width="658" height="442" alt="Creacion archivo dentro de pruebasFTP" src="https://github.com/user-attachments/assets/57a5dab3-f740-4205-813d-d6cc6c25c8fa" />

## Conexión a un servidor FTP
A continuación, nos conectaremos al servidor `ftp.cica.es` de manera anónima. Para ello, ingresamos la dirección en el campo **Servidor** de FileZilla y presionamos **Conexión rápida**.

<img width="853" height="36" alt="Conexion servidor FTP" src="https://github.com/user-attachments/assets/8cb289e3-b288-495e-b186-0b790b3d9f56" />
<img width="1239" height="886" alt="Conexion rapida a FTP" src="https://github.com/user-attachments/assets/092da4bd-3cbf-4008-a0cc-9adffb702368" />


Luego, accedemos a la carpeta `pub` y descargamos el archivo llamado `check` haciendo clic derecho y seleccionando **Descargar**:

<img width="601" height="347" alt="Descargar pub check" src="https://github.com/user-attachments/assets/cffea201-1579-46e5-ab7e-8a1a9ecdf9cd" />

Comprobamos que se haya descargado correctamente 

<img width="529" height="71" alt="Comprobacion Descarga pub check" src="https://github.com/user-attachments/assets/5ec817d5-0e5b-46c8-abf6-c7cecbef441b" />


## Intento de subir archivos
Ahora probaremos subir el archivo que creamos previamente. Seleccionamos el archivo, hacemos clic derecho y elegimos **Subir**. Sin embargo, el servidor puede responder con un mensaje de **permiso denegado**, debido a las restricciones establecidas:

<img width="532" height="105" alt="Intento de subida de datos1 txt (fallido)" src="https://github.com/user-attachments/assets/afbe8f8c-1755-4e08-9aba-d11ef9354982" />

## Desconexión del servidor
Para finalizar, nos desconectamos del servidor haciendo clic en Servidor y Desconectar o simplemente con el atajo de teclado Ctrl + d 


# 3. Instalación y Configuración de vsftpd

En esta sección instalaremos el servidor FTP **vsftpd** en nuestra máquina virtual y configuraremos usuarios y archivos de prueba para verificar su funcionamiento.

---

## 3.1 Instalación del servidor FTP
En primer lugar, instalamos vsftpd con el siguiente comando: **sudo apt install vsftpd**

<img width="909" height="391" alt="sudo apt install vsftpd" src="https://github.com/user-attachments/assets/4468440b-75e5-4308-add8-c61ae998e049" />

Luego comprobamos si el usuario ftp se ha creado y si su directorio principal es /srv/ftp/: **cat /etc/passwd**

<img width="429" height="91" alt="Comprobacion usuario ftp" src="https://github.com/user-attachments/assets/738f9eda-d496-4652-9fe6-b581b70ca585" />

También revisamos los grupos del sistema para confirmar que el usuario ftp pertenece al grupo correcto:**cat /etc/group**

<img width="195" height="41" alt="Comprobacion grupos ftp" src="https://github.com/user-attachments/assets/c93cb283-5dd2-45e0-b34b-6d66b2b297a9" />


Verificamos que la carpeta /srv/ftp exista y que su propietario sea root y el grupo ftp: **ls -ld /srv/ftp**

<img width="318" height="80" alt="Comprobacion creacion carpeta srv ftp" src="https://github.com/user-attachments/assets/01f9c2b2-3281-48e0-b2e9-9806bcc6a4ae" />


Listamos los usuarios que tienen prohibido el acceso al FTP: cat /etc/ftpusers

<img width="524" height="291" alt="Usuarios que no se pueden acceder al servicio FTP" src="https://github.com/user-attachments/assets/f15d7168-a3e6-4ce2-bfc0-79a6a894626f" />

Comprobamos el estado del servicio: **sudo systemctl status vsftpd**

<img width="729" height="275" alt="Comprobacion estado del servidor" src="https://github.com/user-attachments/assets/4bc25e59-f873-47b8-bdc4-b549703878b1" />

Verificamos que el puerto 21 esté activo(Se puede utilizar grep para filtrar y encontrarlo mas facilmente): ss -tlpn | grep :21

<img width="1224" height="151" alt="Comprobacion escucha puerto 21" src="https://github.com/user-attachments/assets/ee957acd-faf2-4548-859f-9c2caeb962eb" />


3.2 Respaldo y creación de usuarios de prueba
Antes de modificar la configuración, hacemos una copia de seguridad del archivo original: sudo mv /etc/vsftpd.conf /etc/vsftpd.conf.bak


<img width="505" height="26" alt="Copia de seguridad" src="https://github.com/user-attachments/assets/526dbcb3-95d7-4f59-a187-73a864154b67" />


Creamos tres usuarios locales para pruebas, asegurándonos de crear sus directorios home con -m y asignamos contraseñas:


sudo useradd -m luis
sudo passwd luis
sudo useradd -m maria
sudo passwd maria
sudo useradd -m pedro
sudo passwd pedro


<img width="341" height="272" alt="Creacion 3 usuarios " src="https://github.com/user-attachments/assets/da82e38f-1169-4659-ad7d-443e99edae43" />


Creamos algunos archivos de prueba para estos usuarios:


<img width="501" height="79" alt="Creacion Ficheros de prueba" src="https://github.com/user-attachments/assets/6692bad9-2f86-4838-8e82-458f17e692ae" />


sudo touch /home/luis/luis{1,2}.txt
sudo chown luis:luis /home/luis/luis*.txt
sudo touch /home/maria/maria{1,2}.txt
sudo chown maria:maria /home/maria/maria*.txt




3.3 Configuración de vsftpd
Editamos el archivo principal de configuración: **sudo nano /etc/vsftpd.conf**


En mi caso esta es la configuración que voy a utilizar


<img width="745" height="677" alt="Configuracion del servidor" src="https://github.com/user-attachments/assets/5ea9672e-ce65-46ca-95e4-b6f6d5fe7f6b" />


Creamos un mensaje de bienvenida para usuarios anónimos en un fichero aparte el cual hemos utilizado en nuestro archivo de configuracion
para que aparezca cuando introduzca en el servidor un usuario anonimo: **sudo nano /srv/ftp/ftp-mensaje**

Este mensaje va a ser : "---You have accessed the public directory server of 'jose.test'---"

<img width="752" height="95" alt="Creacion de mensaje en el archivo" src="https://github.com/user-attachments/assets/ee783b38-7e9d-48ec-aecd-82aaa213c30f" />



Posteriormente definiremos excepciones para usuarios locales que no queremos enjaular: **sudo nano /etc/vsftpd.chroot_list**


En este caso, solo incluimos maria por lo tanto hay que poner dentro de ese archivo el nombre de *maria*.


<img width="740" height="91" alt="excepciones de enjaulamiento" src="https://github.com/user-attachments/assets/4f8f479d-c2d7-48ad-87dc-0f0dea1b919d" />


3.4 Reinicio del servicio y pruebas
Reiniciamos el servidor para aplicar los cambios:


**sudo systemctl restart vsftpd
sudo systemctl status vsftpd
sudo ss -tlpn | grep :21**

<img width="790" height="371" alt="Reinicio y comprobacion" src="https://github.com/user-attachments/assets/16485694-7851-44d4-8e01-1e8db44ac778" />


Conexión de usuario anónimo
Probamos conectarnos como usuario anónimo al servidor (FileZilla oculta los comandos exitosos, por lo que el mensaje de bienvenida puede no mostrarse)


<img width="839" height="96" alt="Fallo Filezilla Conexion servidor (usuario anonimo)" src="https://github.com/user-attachments/assets/8ada90a7-1104-4a86-97a7-45e77b2b6a7f" />


Usuario con excepción (maria). Nos conectamos como maria para comprobar que puede navegar fuera de su home:

<img width="1246" height="767" alt="Conexion a ftp jose test con maria " src="https://github.com/user-attachments/assets/6d48cd18-4c9f-4500-81f2-a611bb2a4866" />


Nos conectaremos con el usuario enjaulado (luis) para verificar que esta limitado a su directorio home: 


<img width="1187" height="470" alt="Comprobacion enjaulamiento luis" src="https://github.com/user-attachments/assets/1fd8b3df-8e74-4d3a-99b3-780470226ed9" />


Observación: luis no puede salir de su home, mientras que maria sí puede explorar todo el sistema de directorios.




