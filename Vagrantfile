#
# Lucas Reis <lucas@programmer.com.br>
#
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.env.enable
  #does not look for updates
  config.vm.box_check_update = false
  #set network access port
  config.vm.network "forwarded_port", guest: 80, host: ENV['HOST_PORT']
  config.vm.network "private_network", type: "dhcp"
  #set sync folder
  config.vm.synced_folder ENV['APP_ROOT_PATH'], "/home/vagrant/site", type: 'nfs'
  config.vm.synced_folder 'logs', "/var/log", type: 'nfs'
  #set vm memory
  config.vm.provider "virtualbox" do |vb|
      vb.memory = ENV['MEMORY']
	  vb.name = "site-vm"
  end
  
  #copy files  
  config.vm.provision "file", source: "conf/site.conf", destination: "/home/vagrant/site.conf"
  config.vm.provision "file", source: "bin/oracle-instantclient12.2-basic_12.2.0.1.0-2_amd64.deb", destination: "/home/vagrant/oracle-instantclient12.2-basic_12.2.0.1.0-2_amd64.deb"
  config.vm.provision "file", source: "bin/oracle-instantclient12.2-devel_12.2.0.1.0-2_amd64.deb", destination: "/home/vagrant/oracle-instantclient12.2-devel_12.2.0.1.0-2_amd64.deb"
  config.vm.provision "file", source: "conf/oci8.ini", destination: "/home/vagrant/oci8.ini"
  config.vm.provision "file", source: "conf/xdebug.conf", destination: "/home/vagrant/xdebug.conf"
  #run scripts
  config.vm.provision "shell", path: "scripts/update-timezone.sh", args: ENV['TIME_ZONE']
  config.vm.provision "shell", path: "scripts/update-repository-add-vagrant-adm-group.sh"
  config.vm.provision "shell", path: "scripts/install-apache.sh"
  config.vm.provision "shell", path: "scripts/install-php.sh", args: ENV['PHP_VERSION']
  config.vm.provision "shell", path: "scripts/add-site-conf.sh", args: ENV['PHP_VERSION']
  config.vm.provision "shell", path: "scripts/install-oci8.sh", args: ENV['PHP_VERSION']
end
