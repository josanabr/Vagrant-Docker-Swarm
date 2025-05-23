# Vagrant + Docker Swarm

*Fecha: 2021-08-10*

*Última actualización: 2025-05-23*

En este repositorio se encuentran los archivos que permiten el despliegue de la herramienta Docker Swarm sobre un cluster de máquinas virtuales.

Para llevar a cabo el despliegue de este cluster se necesitan las siguientes herramientas instaladas en su computador (adicional se indica la versión donde fueron probados estos scripts y el comando para validar la disponibilidad de la herramienta en su sistema):

<table>
<tr>
<td> <b> Herramienta </b> </td> 
<td> <b> Versión </b> </td> 
<td> <b> Comando validación </b> </td> 
</tr>
<tr>
<td> Vagrant </td> 
<td> 2.2.6 </td> 
<td> <code>vagrant --version</code> </td> 
</tr>
<tr>
<td> VirtualBox </td> 
<td> 6.1.50_Ubuntur161033 </td> 
<td> <code>VBoxManage --version</code> </td> 
</tr>
</table>

Una vez clonado este repositorio en su máquina, ingrese al directorio `Vagrant-Docker-Swarm` y ejecute el comando `vagrant up`. 
Al ejecutar este comando se comenzará el proceso de creación de tres máquinas virtuales que serán aprovisionadas con el orquestador Docker Swarm.

Una vez aprovisionadas se puede ingresar al nodo `manager` a través del comando `vagrant ssh manager` y ejecutar los comandos que están en [este enlace](https://docs.docker.com/engine/swarm/stack-deploy/).

---

Es posible que se ejecute una vez la creación de las máquinas virtuales `docker swarm init` y el comando arroje la cadena de conexión para nuevos nodos. 
Si por alguna razón esa cadena se pierde, es posible pedirle a `docker` que muestre nuevamente la cadena de la siguiente manera:

```
docker swarm join-token manager
```
