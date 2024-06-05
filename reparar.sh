#!/bin/bash
#
#===============================================================================
#
# File...........: reparar.sh
# Title..........: Reparar
# Program........: Shell Code -  GNU/Linux
#
# Description....: Repara o sistema APT
#
# Copyright......: Copyright(c) 2024 / @Diego.Casagranda - HackLab
# License........: GNU GENERAL PUBLIC LICENSE - Version 3, 29 June 2007
#
# Author.........: Diego Casagranda
# E-Mail.........: diego.casagranda@mail.ru
#
# Dependency.....: apt
#
# Date...........: 05/06/2024
# Update.........: None
#
# Version........: 0.1.0
#
#===============================================================================
#
# ###########
# # History #
# ###########
#
#     05/06/2024 : Criação do codigo
#
#===============================================================================

# Verifica se é o root 
[ "$UID" -eq 0 ] || { echo "Execcute como root."; exit 1;}

# Limpa arquivos temporarios
echo "limpando diretorios..."
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend

# atualiza dependencias e remove pacotes obsoletos
echo "atualizando..."
sudo dpkg --configure -a

sudo apt clean
sudo apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
sudo apt upgrade
sudo apt dist-upgrade

sudo apt-get autoremove -y
sudo apt-get autoclean

# Exibe mensagem final
echo "reparação concluida..."
