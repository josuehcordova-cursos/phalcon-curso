Vagrant.configure("2") do |config|
    config.vm.box = "anorad/phalcon-framework"
    ## Configurar Red
    config.vm.network "private_network", ip: "192.168.3.11"
    ## Sincronizar Proyecto
    config.vm.synced_folder ".", "/var/www/html", type: "rsync", :rsync__exclude => ['.git/', 'provisioning/', 'Vagrantfile'], owner: "www-data", group: "www-data"
    config.vm.synced_folder ".", "/home/vagrant/curso"
    
    ## Configurar caracteriscas de máquina
    config.vm.hostname = "phalcon"
    config.vm.provider :virtualbox do |vb|
      vb.name = "phalcon-curso"
      vb.memory = 1024
      vb.cpus = 1
    end

    ## Provisionamiento de entorno
    config.vm.provision "Install Base Components", type: "shell", privileged: false, path: "provisioning/install_components.sh"    
    config.vm.provision "Install Phalcon DevTools", type: "shell", privileged: false, path: "provisioning/install_phalcon-devtools.sh"    

end
