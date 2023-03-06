#!/usr/bin/env bash
#
# Script para instalar 'docker' y 'docker-compose'
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-08-10
#
# Modificado: 
#  2023-03-03: Algunas tareas han sido automatizadas por el script propio de
#              Docker. Ahora 'Docker' viene con 'compose', no se requiere 
#              instalación aparte.
# ---
#
# Las siguientes lineas muestran commo instalar Docker del repositorio oficial
#
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh 
rm -f get-docker.sh
#
# Habilitar servicio de Docker para arrancar junto con los demás servicios
#
sudo systemctl start docker
sudo systemctl enable docker
#
# Adicionando el grupo 'docker' al perfil del usuario 'vagrant'
#
sudo usermod -aG docker vagrant
