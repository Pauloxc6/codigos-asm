#!/usr/bin/bash

clear
date1=$(date)

#Banner
figlet Compilador ASM
printf "\e[1;97mBY: pauloxc6\n"
printf "\e[1;97mGithub: Pauloxc6   |                     ($date1)\n"
printf "\n"

#Tratamento de erros
[[ $# -le 0 ]] && printf "\e[1;96mHelp: $0 \e[1;97m<script.asm> \e[1;96m-h\n" && exit 1

#variaveis
arch="x86"
sys="linux"
p1=$1

#Retira a extensao .asm do script e armazena o nome na variavel name
name=$(echo $p1 | sed 's/\.asm//')


#Menu Help
while [[ $# -gt 0 ]]
do
	case $1 in

		-h|--help)
			printf "\e[1;93mHelp Menu:\n"
	    		printf "\e[1;96mHelp: $0 \e[1;97m<script.asm> \e[1;93m--arch \e[1;92m[arquitetura] \e[1;93m--sys \e[1;92m[system] \e[1;93m-d \e[1;92m[disassemble] \e[1;93m[-h|--help]\n"
	    		printf "\e[1;96m[--help] Mostra o help do programa\n"
	    		printf "\e[1;96m[-v|-version] Version\n"
	    		printf "\e[1;96m[--arch] Artitetura do computudor \e[1;94m[x86_64] ou \e[1;94m[x86]\n"
	    		printf "\e[1;96m[--sys] Sistema Operacional \e[1;94m[linux] ou \e[1;94m[windowns]\n"
	    		printf "\e[1;96m[-d] Disasemble Coding (Somente Compilado)\n"
	   		exit 0;;

	 	-v|--version)
	 		printf "\e[1;97mVersion: 2.0\n"
	 		exit 0 ;;
	 	--arch)
	 		arch="$2"
	 		shift ;;

	 	--sys)
	 		sys="$2"
	 		shift ;;

	 	-d)

	 		if [[ $sys == "linux" ]];then
	 			clear
    				printf "\e[1;94mDisassemble .....\n"
        			echo ""
    				objdump -dM intel $name

	 		elif [[ $sys == "windows" ]];then
	 			clear
    				printf "\e[1;94mDisassemble .....\n"
        			echo ""
    				objdump -dM intel -M addr16,data16 $name

			fi
	 		exit 0 ;;

	esac
	shift
done

#compilando
if [[ $arch == "x86_64" ]];then

	if [[ $sys == "linux" ]];then
		nasm -f elf64 $p1
	elif [[ $sys == "windows" ]];then
		nasm -f win64 $p1
	fi

fi

if [[ $arch == "x86" ]];then

	if [[ $sys == "linux" ]];then
		nasm -f elf32 $p1

	elif [[ $sys == "windows" ]];then
		nasm -f win32 $p1
	fi
fi


if [[ $sys == "linux" ]];then
	if [[ $arch == "x86_64" ]];then

		ld -o $name $name.o
		printf "\e[1;94m[+] Compilando \e[1;97m[$name.asm] \e[1;96m[$sys - $arch] .....\n"
		printf "\n"
		printf "\e[1;93mForam Criado os Arquivos: \n"
		printf "\e[1;94m[-] --> \e[1;97m$name.o\n"
		printf "\e[1;94m[-] --> \e[1;97m$name\n"

	elif [[ $arch == "x86" ]]; then

		ld -m elf_i386 -o $name $name.o
		printf "\e[1;94m[+] Compilando \e[1;97m[$name.asm] \e[1;96m[$sys - $arch] .....\n"
		printf "\n"
		printf "\e[1;93mForam Criado os Arquivos: \n"
		printf "\e[1;94m[-] --> \e[1;97m$name.o\n"
		printf "\e[1;94m[-] --> \e[1;97m$name\n"

	fi
fi


if [[ $sys == "windows" ]];then
	if [[ $arch == "x86_64" ]];then
		ld -o $name $name.obj
		printf "\e[1;94mF[+] Compilando \e[1;97m[$name.asm] \e[1;96m[$sys - $arch] .....\n"
		printf "\n"
		printf "\e[1;93mFForam Criado os Arquivos: \n"
		printf "\e[1;94m[-] --> \e[1;97m$name.obj\n"
		printf "\e[1;94m[-] --> \e[1;97m$name\n"

	elif [[ $arch == "x86" ]];then

		ld -m elf_i386 -o $name $name.obj
		printf "\e[1;94mF[+] Compilando \e[1;97m[$name.asm] \e[1;96m[$sys - $arch] .....\n"
		printf "\n"
		printf "\e[1;93mFForam Criado os Arquivos: \n"
		printf "\e[1;94m[-] --> \e[1;97m$name.obj\n"
		printf "\e[1;94m[-] --> \e[1;97m$name\n"
	fi

fi
