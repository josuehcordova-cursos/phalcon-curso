#!/bin/bash
export mysql_user="root"
export mysql_password="welcome1"

export app_user=$3
export app_password=$4
export app_database=$5

echo -e "\n============================="
echo -e "Descargar Backup"
echo -e "============================="
export archivo_backup="hansllan_bd_sys_facturacionv6.sql.gz"

wget --user=$1 --password="$2" "https://static.controlaya.com/backups/$archivo_backup" --output-document="/tmp/$archivo_backup"

echo -e "\n============================="
echo -e "Restaurar BD"
echo -e "============================="
echo -e "Eliminar Base de Datos, si existe."
mysql --user=$mysql_user --password=$mysql_password -e "DROP DATABASE IF EXISTS $app_database"
echo -e "Crear Base de Datos."
mysql --user=$mysql_user --password=$mysql_password -e "CREATE DATABASE IF NOT EXISTS $app_database CHARACTER SET latin1 COLLATE latin1_swedish_ci"
echo -e "Restaurar Base de Datos."
gunzip < "/tmp/$archivo_backup" | mysql --user=$mysql_user --password=$mysql_password $app_database

echo -e "\n============================="
echo -e "Configurar Base de Datos"
echo -e "============================="

mysql --user=$mysql_user --password=$mysql_password mysql <<MYSQL
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
MYSQL

echo -e "\n============================="
echo -e "Generar Credenciales"
echo -e "============================="
echo -e "app_user=$app_user"
echo -e "app_password=$app_password"

mysql --user=$mysql_user --password=$mysql_password mysql <<MYSQL
DROP USER IF EXISTS '$app_user'@'localhost';
CREATE USER '$app_user'@'localhost' IDENTIFIED BY '$app_password';
GRANT ALL PRIVILEGES ON $app_database.* TO '$app_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL

