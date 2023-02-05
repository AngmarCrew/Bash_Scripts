#!/bin/bash

function ctrl_c(){
	echo -e "\n\n[!]Saliendo...\n"
	exit 1
}

#ctrl+c(captura si le doy se corta)
trap ctrl_c INT

first_file_name="data.gz"
##quedarnos con el siguiente archivo a descomprimir listandolo con 7z l
decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | awk '$NF{print$NF}')"

##ejecutamos la descompresion y redirigimos la salida al dev/null para que no se vea a la hora de la ejecución
7z x $first_file_name &>/dev/null

## si dentro de decompressed_file_name hay descompimelo y metemelo por el null y tras esto imprime lo que sea descomprimido

while [ $decompressed_file_name ]; do

	echo -e "\n[+] nuevo archivo descomprimido: $decompressed_file_name"
	7z x $decompressed_file_name &>/dev/null
	decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"

done

#cuando decompressed file name no valga nada seguramente nos de un error de ahi que lo mandemos al null y ya nuestro archivo asci podemos leerlo 
