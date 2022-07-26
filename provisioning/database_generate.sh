#!/bin/bash
export mysql_user="root"
export mysql_password="welcome1"
export app_database="phalcon"
export archivo_backup="/tmp/phalcon.sql"

echo -e "\n============================="
echo -e "Generar BD"
echo -e "============================="
echo -e "Eliminar Base de Datos, si existe."
mysql --user=$mysql_user --password=$mysql_password -e "DROP DATABASE IF EXISTS $app_database"
echo -e "Crear Base de Datos."
mysql --user=$mysql_user --password=$mysql_password -e "CREATE DATABASE IF NOT EXISTS $app_database CHARACTER SET latin1 COLLATE latin1_swedish_ci"
echo -e "Cargar Script."
cat < $archivo_backup | mysql --user=$mysql_user --password=$mysql_password $app_database

