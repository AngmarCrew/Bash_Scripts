#!/bin/bash

function ctrl_c(){
	echo -e "\n\n [+] Saliendo....\n"
	exit 1
}

#ctrl+c
trap ctrl_c INT

tput civis

#recorrer las ips
for ip in $(seq 1 254); do
	#ver mediante ping si los hosts estan activos
	  timeout 1 bash -c "ping -c 1 192.168.1.$ip &>/dev/null" && echo "[+] host 192.168.1.$ip - ACTIVO" &
done; wait #wait para que los hilos finalizen

tput cnorm
