#!/bin/bash
# Instalar herramienta
sudo apt install mysql-server
echo -e "\n============================="
echo -e "Obtener Credenciales"
echo -e "============================="
export user=$(sudo grep user /etc/mysql/debian.cnf | head -n1 | awk '{print $3}')
echo -e "user=$user"
export password=$(sudo grep password /etc/mysql/debian.cnf | head -n1 | awk '{print $3}')
echo -e "password=$password"
export password_new="welcome1"
# Conectarse a MySql y Cambiar contraseña
mysql --user=$user --password=$password mysql <<MYSQL
SELECT User, Host, plugin FROM mysql.user;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
COMMIT;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${password_new}';
ALTER USER 'root'@'%' IDENTIFIED BY '${password_new}';
FLUSH PRIVILEGES;
COMMIT;
MYSQL

#  Reiniciar servicio
sudo service mysql restart

echo -e "\n============================="
echo -e "Verificar cambio de password "
echo -e "============================="
echo -e "Password ROOT=$password_new"
mysql -uroot -p$password_new -e "SHOW DATABASES"