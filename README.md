# Configuración Inicial del Servidor DNS

## 1. Preparación del entorno
Primero, clonamos nuestro proyecto previo **dns-paso-a-paso** para utilizarlo como base. Esto nos permitirá tener un servidor DNS funcional desde el inicio.
<br>

<img width="1560" height="934" alt="1" src="https://github.com/user-attachments/assets/e0ab6474-7109-4ba2-a101-2c88bea4e36f" />

<br>

## 2. Ajustes del servidor

<br>
A continuación, realizamos las modificaciones necesarias en el servidor. Esto incluye:
<br>

Actualizar las direcciones IP, en mi caso mi nueva IP es 192.168.56.101 (de esta manera no tendremos problemas)
<br>
<img width="893" height="389" alt="2 Cambio de IP para evitar problemas" src="https://github.com/user-attachments/assets/03239a9d-730c-49e7-b472-a4368c27571b" />
<br>
<br>

Configurar las zonas según los requerimientos.
<br>
Todos los archivos que necesitan cambios se encuentran en la carpeta `config`.
<br>
No voy a detallar como configurar un servidor DNS ya que lo hicimos en la practica anterior.
<br>
<br>
<br>
## 3. Verificación del funcionamiento
Para asegurarnos de que nuestro servidor DNS está funcionando correctamente, utilizaremos los comandos **dig** y **nslookup**.
<br>
### Verificación con dig
Ejecutamos el siguiente comando: **dig @192.168.56.101 debian.jose.test**
<br>
Deberíamos obtener un resultado similar al siguiente:
<br>
<img width="577" height="326" alt="3 Comprobacion dig" src="https://github.com/user-attachments/assets/ae153d9e-a998-402a-82af-80750eaf5de4" />
<br>
Verificación con nslookup
<br>
Ejecutamos el siguiente comando: **nslookup debian.jose.test 192.168.56.101**
<br>
El resultado esperado sería algo como esto:
<br>
<img width="484" height="154" alt="4 Comprobacion nslookup" src="https://github.com/user-attachments/assets/1772cb0b-f289-4c16-8c6c-0d002217eb15" />




<br>
<br>
# 2. Uso de un Cliente FTP con Interfaz Gráfica (GUI)
<br>
En esta sección vamos a instalar y probar un cliente FTP con interfaz gráfica. Para este ejemplo utilizaremos **FileZilla**, aunque puedes emplear cualquier otro.
<br>
## Instalación y primera ejecución
El primer paso es descargar FileZilla desde su página oficial e instalarlo. Esto es lo que nos encontraremos una vez abramos el programa por primera vez:
<br>
<img width="1237" height="897" alt="Instalar Filezilla" src="https://github.com/user-attachments/assets/0314c516-aa2b-4ec7-b5ad-4bbe4ba6d329" />
<br>
<br>
## Creación de directorios y archivos
<br>
Ahora vamos a crear un directorio de prueba llamado `pruebasFTP` y entrar en él:
<br>
<img width="1234" height="320" alt="pruebasftp" src="https://github.com/user-attachments/assets/169bcc25-eb17-4b91-9b7d-9dcd577e2ef8" />
<br>
<br>
Dentro del directorio, crearemos un archivo de prueba con cualquier contenido que deseemos:
<br>
<img width="658" height="442" alt="Creacion archivo dentro de pruebasFTP" src="https://github.com/user-attachments/assets/57a5dab3-f740-4205-813d-d6cc6c25c8fa" />
<br>
<br>
## Conexión a un servidor FTP
<br>
A continuación, nos conectaremos al servidor `ftp.cica.es` de manera anónima. Para ello, ingresamos la dirección en el campo **Servidor** de FileZilla y presionamos **Conexión rápida**.
<br>
<img width="853" height="36" alt="Conexion servidor FTP" src="https://github.com/user-attachments/assets/8cb289e3-b288-495e-b186-0b790b3d9f56" />
<img width="1239" height="886" alt="Conexion rapida a FTP" src="https://github.com/user-attachments/assets/092da4bd-3cbf-4008-a0cc-9adffb702368" />

<br>
<br>


Luego, accedemos a la carpeta `pub` y descargamos el archivo llamado `check` haciendo clic derecho y seleccionando **Descargar**:
<br>

<img width="601" height="347" alt="Descargar pub check" src="https://github.com/user-attachments/assets/cffea201-1579-46e5-ab7e-8a1a9ecdf9cd" />
<br>
<br>
Comprobamos que se haya descargado correctamente 
<br>
<br>
<img width="529" height="71" alt="Comprobacion Descarga pub check" src="https://github.com/user-attachments/assets/5ec817d5-0e5b-46c8-abf6-c7cecbef441b" />
<br>
<br>
## Intento de subir archivos
<br>
Ahora probaremos subir el archivo que creamos previamente. Seleccionamos el archivo, hacemos clic derecho y elegimos **Subir**. Sin embargo, el servidor puede responder con un mensaje de **permiso denegado**, debido a las restricciones establecidas:
<br>
<img width="532" height="105" alt="Intento de subida de datos1 txt (fallido)" src="https://github.com/user-attachments/assets/afbe8f8c-1755-4e08-9aba-d11ef9354982" />
<br>
<br>
## Desconexión del servidor
<br>
Para finalizar, nos desconectamos del servidor haciendo clic en Servidor y Desconectar o simplemente con el atajo de teclado Ctrl + d 
<br>

# 3. Instalación y Configuración de vsftpd
<br>
En esta sección instalaremos el servidor FTP **vsftpd** en nuestra máquina virtual y configuraremos usuarios y archivos de prueba para verificar su funcionamiento.
<br>
---
<br>
## 3.1 Instalación del servidor FTP
<br>
En primer lugar, instalamos vsftpd con el siguiente comando: **sudo apt install vsftpd**
<br>
<img width="909" height="391" alt="sudo apt install vsftpd" src="https://github.com/user-attachments/assets/4468440b-75e5-4308-add8-c61ae998e049" />
<br><br>
Luego comprobamos si el usuario ftp se ha creado y si su directorio principal es /srv/ftp/: **cat /etc/passwd**
<br>
<img width="429" height="91" alt="Comprobacion usuario ftp" src="https://github.com/user-attachments/assets/738f9eda-d496-4652-9fe6-b581b70ca585" />
<br>
También revisamos los grupos del sistema para confirmar que el usuario ftp pertenece al grupo correcto:**cat /etc/group**
<br>
<img width="195" height="41" alt="Comprobacion grupos ftp" src="https://github.com/user-attachments/assets/c93cb283-5dd2-45e0-b34b-6d66b2b297a9" />

<br><br>
Verificamos que la carpeta /srv/ftp exista y que su propietario sea root y el grupo ftp: **ls -ld /srv/ftp**
<br>
<img width="318" height="80" alt="Comprobacion creacion carpeta srv ftp" src="https://github.com/user-attachments/assets/01f9c2b2-3281-48e0-b2e9-9806bcc6a4ae" />
<br>
<br>
Listamos los usuarios que tienen prohibido el acceso al FTP: cat /etc/ftpusers
<br>
<img width="524" height="291" alt="Usuarios que no se pueden acceder al servicio FTP" src="https://github.com/user-attachments/assets/f15d7168-a3e6-4ce2-bfc0-79a6a894626f" />
<br><br>
Comprobamos el estado del servicio: **sudo systemctl status vsftpd**
<br>
<img width="729" height="275" alt="Comprobacion estado del servidor" src="https://github.com/user-attachments/assets/4bc25e59-f873-47b8-bdc4-b549703878b1" />
<br><br>
Verificamos que el puerto 21 esté activo(Se puede utilizar grep para filtrar y encontrarlo mas facilmente): ss -tlpn | grep :21
<br>
<img width="1224" height="151" alt="Comprobacion escucha puerto 21" src="https://github.com/user-attachments/assets/ee957acd-faf2-4548-859f-9c2caeb962eb" />
<br><br>

3.2 Respaldo y creación de usuarios de prueba
<br>
Antes de modificar la configuración, hacemos una copia de seguridad del archivo original: sudo mv /etc/vsftpd.conf /etc/vsftpd.conf.bak
<br>

<img width="505" height="26" alt="Copia de seguridad" src="https://github.com/user-attachments/assets/526dbcb3-95d7-4f59-a187-73a864154b67" />
<br>
<br>
Creamos tres usuarios locales para pruebas, asegurándonos de crear sus directorios home con -m y asignamos contraseñas:
<br>

sudo useradd -m luis
sudo passwd luis
sudo useradd -m maria
sudo passwd maria
sudo useradd -m pedro
sudo passwd pedro
<br>
<br>
<img width="341" height="272" alt="Creacion 3 usuarios " src="https://github.com/user-attachments/assets/da82e38f-1169-4659-ad7d-443e99edae43" />

<br><br>
Creamos algunos archivos de prueba para estos usuarios:
<br><br>

<img width="501" height="79" alt="Creacion Ficheros de prueba" src="https://github.com/user-attachments/assets/6692bad9-2f86-4838-8e82-458f17e692ae" />

<br>
sudo touch /home/luis/luis{1,2}.txt
sudo chown luis:luis /home/luis/luis*.txt
sudo touch /home/maria/maria{1,2}.txt
sudo chown maria:maria /home/maria/maria*.txt


<br><br>

3.3 Configuración de vsftpd
<br>
Editamos el archivo principal de configuración: **sudo nano /etc/vsftpd.conf**
<br><br>

En mi caso esta es la configuración que voy a utilizar
<br>

<img width="745" height="677" alt="Configuracion del servidor" src="https://github.com/user-attachments/assets/5ea9672e-ce65-46ca-95e4-b6f6d5fe7f6b" />

<br><br>
Creamos un mensaje de bienvenida para usuarios anónimos en un fichero aparte el cual hemos utilizado en nuestro archivo de configuracion
para que aparezca cuando introduzca en el servidor un usuario anonimo: **sudo nano /srv/ftp/ftp-mensaje**
<br>
Este mensaje va a ser : "---You have accessed the public directory server of 'jose.test'---"
<br>
<img width="752" height="95" alt="Creacion de mensaje en el archivo" src="https://github.com/user-attachments/assets/ee783b38-7e9d-48ec-aecd-82aaa213c30f" />
<br>

<br>
Posteriormente definiremos excepciones para usuarios locales que no queremos enjaular: **sudo nano /etc/vsftpd.chroot_list**
<br>
<br>
En este caso, solo incluimos maria por lo tanto hay que poner dentro de ese archivo el nombre de *maria*.
<br>

<img width="740" height="91" alt="excepciones de enjaulamiento" src="https://github.com/user-attachments/assets/4f8f479d-c2d7-48ad-87dc-0f0dea1b919d" />

<br><br>
3.4 Reinicio del servicio y pruebas
<br>
Reiniciamos el servidor para aplicar los cambios:
<br>

**sudo systemctl restart vsftpd
sudo systemctl status vsftpd
sudo ss -tlpn | grep :21**
<br>
<img width="790" height="371" alt="Reinicio y comprobacion" src="https://github.com/user-attachments/assets/16485694-7851-44d4-8e01-1e8db44ac778" />
<br><br>

Conexión de usuario anónimo
<br>
Probamos conectarnos como usuario anónimo al servidor (FileZilla oculta los comandos exitosos, por lo que el mensaje de bienvenida puede no mostrarse)
<br>

<img width="839" height="96" alt="Fallo Filezilla Conexion servidor (usuario anonimo)" src="https://github.com/user-attachments/assets/8ada90a7-1104-4a86-97a7-45e77b2b6a7f" />
<br><br>

Usuario con excepción (maria). Nos conectamos como maria para comprobar que puede navegar fuera de su home:
<br>
<img width="1246" height="767" alt="Conexion a ftp jose test con maria " src="https://github.com/user-attachments/assets/6d48cd18-4c9f-4500-81f2-a611bb2a4866" />

<br><br>
Nos conectaremos con el usuario enjaulado (luis) para verificar que esta limitado a su directorio home: 
<br>

<img width="1187" height="470" alt="Comprobacion enjaulamiento luis" src="https://github.com/user-attachments/assets/1fd8b3df-8e74-4d3a-99b3-780470226ed9" />
<br><br>

Observación: luis no puede salir de su home, mientras que maria sí puede explorar todo el sistema de directorios.
<br>



# 4. Configuración de un servidor vsftpd seguro (FTPS)
<br>
En esta sección vamos a configurar nuestro servidor FTP para que funcione de forma segura mediante **FTPS**, usando un certificado autofirmado.

---
<br>
## 4.1 Creación de certificados
Primero, creamos la carpeta donde guardaremos el certificado: **sudo mkdir -p /etc/ssl/certs**
<br>
A continuación, generamos un certificado autofirmado para nuestro dominio: 

**sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/certs/jose.test.key \
 -out /etc/ssl/certs/jose.test.pem**
<br>

<img width="1071" height="395" alt="certificado" src="https://github.com/user-attachments/assets/5427650b-a8a0-4fbc-b950-070eaf5c4cfe" />
<br>

4.2 Configuración del servidor para FTPS
Modificamos el archivo de configuración de vsftpd para habilitar FTPS y otros ajustes relacionados con la seguridad
(deberemos pegarlo abajo de nuestra anterior configuración) En mi caso esta es mi configuración: 
<br>


<img width="519" height="420" alt="Continuacion archivo de configuracion servidor" src="https://github.com/user-attachments/assets/67690021-47e6-41f1-8185-924cfc0facbe" />
<br><br>

4.3 Reinicio del servicio y verificación
Reiniciamos el servidor para aplicar la configuración:

**sudo systemctl restart vsftpd
sudo systemctl status vsftpd
sudo ss -tlpn | grep :21**

<img width="794" height="332" alt="reinicio y comprobacion despues de certificado" src="https://github.com/user-attachments/assets/6447a9ab-fefc-409d-bc96-da971d3c165e" />
<br><br>

4.4 Pruebas de conexión con FTPS
Conexión de usuario local (luis)
Nos conectamos como luis usando FTPS. Aparecerá un aviso para aceptar y confiar en el certificado; al aceptar, la conexión se establecerá de forma segura. Durante la descarga de archivos, se mostrará un icono indicando que la transferencia es segura y un candado en la ventana de FileZilla:
<br>
<img width="1233" height="876" alt="confirmacion certificado Luis" src="https://github.com/user-attachments/assets/c0dc94c1-b5d0-4cfc-8bde-f7f9a9ce9b42" />
<br>
<img width="1233" height="889" alt="Conectado luis dario y descarga archivo" src="https://github.com/user-attachments/assets/a6896aa4-315c-4ed0-afd0-264e8fcc05c3" />

<br><br>
Intento de conexión anónima
Si intentamos conectarnos como usuario anónimo con FTPS, el servidor rechazará la conexión debido a la configuración aplicada:
<br>
<img width="502" height="181" alt="conexion como anonimo" src="https://github.com/user-attachments/assets/28ded6d1-df98-4b8e-800f-1abb515bf8f8" />
<br><br>


Conexión de usuario local con excepción como es el caso de maria
<br>
<img width="1238" height="882" alt="Conexion maria" src="https://github.com/user-attachments/assets/b4b3a438-a520-4802-94e8-a170a48c152e" />
<br><br>
Finalmente, nos conectamos como maria usando FTPS. Al igual que con luis, aparecerá la ventana para aceptar el certificado y la conexión será segura:






