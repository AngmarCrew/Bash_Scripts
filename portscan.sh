#!/bin/bash

function ctrl_c(){
	echo -e "\n\n [+] Saliendo....\n"
	tput cnorm; exit 1
}

#ctrl+c
trap ctrl_c INT

tput civis #ocultar cursor

#recorrer los puertos#

for port in $(seq 1 65535); do
	#mostrar puertos abiertos operador & para hilos"
	(echo ' ' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN" &
done; wait #wait para que los hilos finalizen

tput cnorm #recuperamos el cursos 
