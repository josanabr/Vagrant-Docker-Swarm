#!/usr/bin/env bash
#
# Este script permite la configuracion de nodos en un ambiente de 'Docker Swarm'
#  
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-08-10
#
# ---
#
# Se definen algunas variables, 
#
IP=$(ifconfig enp0s8 | head -n 2 | tail -n 1 | awk '{print $2}')
JOIN_SCRIPT="/vagrant/swarm-join"
#
# Esta funcion permite el unirse a un enjambre
#
join_swarm() {
  if [ ! -f ${JOIN_SCRIPT} ]; then
    echo "Script para unirse a docker swarm no disponible"
    exit 1
  fi
  . ${JOIN_SCRIPT}
}
#
# Esta funcion permite crear un enjambre
#
create_swarm() {
  tmpfile=$(mktemp /tmp/swarm.XXXXXX)
  docker swarm init --advertise-addr ${IP} > ${tmpfile}
  grep "docker swarm" ${tmpfile}  | head -n 1 | awk '{$1=$1;print}' > ${JOIN_SCRIPT}
  rm ${tmpfile}
}
#
# Aqui comienza la ejecucion del script, es como el 'main' del script
#
if [ "${1}" == "manager" ]; then
  create_swarm
else
  join_swarm
fi

