#!/usr/bin/bash

clear

figlet Compilador ASM
printf "\e[1;97mBY: pauloxc6\n"

#Tratamento de erros
[[ $#-le 0 ]] && printf "\e[1;96mHelp: ./casm.sh \e[1;93m<script.asm>" && exit 1

p1=$1

#Retira a extensao .asm do script e armazena o nome na variavel name
name=$(echo $p1 | sed 's/\.asm//')

#Menu
echo ""
echo "Tipos de Compilamentos"

echo ""
echo "Linux"
echo "1. 64 bits [ELF64]"
echo "2. 32 bits [ELF32]"
echo ""

echo ""
echo "Windows"
echo "3. 64 bits [WIN64]"
echo "4. 32 bits [WIN32]"

echo ""
echo "5. exit"

echo ""
read -p "Escolha um tipo de compilamento: " op
case $op in

    1)
      	 echo "[+] Compilando [Linux - 64 bits] ....."
         nasm -f elf64 $p1
         ld -o $name $name.o
         echo ""
         echo "Foram Criado os Arquivos: "
         echo "[-] --> $name.o"
         echo "[-] --> $name";;
         exit 0 ;;

    2)
  	     echo "[+] Compilando [Linux - 32 bits] ....."
  	     nasm -f elf32 $p1
  	     ld -m elf_i386 -o $name $name.o
         echo ""
  	     echo "Foram Criado os Arquivos: "
  	     echo "[-] --> $name.o"
  	     echo "[-] --> $name";;
         exit 0 ;;

    3)
  	     echo "[+] Compilando [Windows - 64 bits] ....."
  	     nasm -f win64 $p1
  	     ld -o $name $name.o
  	     echo ""
  	     echo "Foram Criado os Arquivos: "
  	     echo "[-] --> $name.o"
  	     echo "[-] --> $name";;
         exit 0 ;;


    4)
 	     echo "[+] Compilando [Windows - 32 bits] ....."
  	     nasm -f win32 $p1
  	     ld -m elf_i386 -o $name $name.o
             echo ""
  	     echo "Foram Criado os Arquivos: "
  	     echo "[-] --> $name.o"
  	     echo "[-] --> $name" ;;
         exit 0 ;;


    5)
  	     echo "[+] Saindo ......"
  	     exit 0 ;;

    *)
  	     echo "Error: você digita um número entre 1 a 5!"
  	     exit 0 ;;
esac
