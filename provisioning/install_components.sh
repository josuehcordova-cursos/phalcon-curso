#!/bin/bash
# echo -e "\n============================="
# echo -e "Actualizar Sistema"
# echo -e "============================="
# sudo apt update -y

echo -e "\n============================="
echo -e "Instalar Composer"
echo -e "============================="
echo -e  "Instalar paquetes necesarios en Ubuntu"
sudo apt install -y curl php-cli php-mbstring git unzip
echo -e "Descargar el archivo de instalación de Composer"
sudo curl -sS https://getcomposer.org/installer -o /opt/composer-setup.php
echo -e "Instalar Composer de forma global una vez descargado"
sudo php /opt/composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo -e "Verificar Instalación de composer"
composer --version

echo -e "\n============================="
echo -e "Instalar wkhtmltopdf 0.12.6"
echo -e "Referencia: "
echo -e "- https://wkhtmltopdf.org/"
echo -e "============================="
echo -e "Descargar el archivo de instalación"
sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb -P /tmp/
echo -e "Instalar Dependencias de wkhtmltopdf"
sudo apt install -y fontconfig libxrender1 xfonts-75dpi xfonts-base
sudo apt --fix-broken -y install
echo -e "Instalar wkhtmltopdf"
sudo dpkg -i /tmp/wkhtmltox_0.12.6-1.bionic_amd64.deb
echo -e "Verificar Instalación de wkhtmltopdf"
wkhtmltopdf -V