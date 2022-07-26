#!/bin/bash
echo -e "\n============================================="
echo -e "Crear composer.json"
echo -e "==============================================="
sudo mkdir /opt/phalcon-devtools && cd /opt/phalcon-devtools
echo '{"require-dev": { "phalcon/devtools": "^3.4" }}' | sudo tee composer.json
sudo composer install

echo -e "\n============================="
echo -e "Crear Acceso Directo"
echo -e "============================="
sudo ln -s $(pwd)/vendor/phalcon/devtools/phalcon /usr/bin/phalcon
sudo chmod ugo+x /usr/bin/phalcon
phalcon info