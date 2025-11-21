#!/usr/bin/env bash
#
# Script que permite la instalacion de Docker y sus correspondientes 
# herramientas
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2025/11/21
#
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#
# Enable that 'vagrant' user can execute 'docker' commands
#
sudo usermod -aG docker vagrant
