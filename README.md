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



