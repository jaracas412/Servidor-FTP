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





