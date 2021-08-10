# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Esta linea permite que todos los nodos definidos en este 'Vagrantfile' 
  # instalen 'docker' y 'docker-compose'
  config.vm.provision "shell", path: "install_docker_tools.sh"
  config.vm.provision "shell", inline: "cat /vagrant/hosts >> /etc/hosts"
  config.vm.box = "ubuntu/bionic64"
  config.vm.define "manager" do |swarm|
  	swarm.vm.hostname = "manager"
	swarm.vm.network "private_network", ip: "192.168.33.10"
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
		vb.customize [ 'modifyvm', :id, '--name', 'swarm-manager' ]
  	end
  end
  config.vm.define "worker-01" do |swarm|
  	swarm.vm.hostname = "worker-01"
	swarm.vm.network "private_network", ip: "192.168.33.11"
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
		vb.customize [ 'modifyvm', :id, '--name', 'worker-01' ]
  	end
  end
  config.vm.define "worker-02" do |swarm|
  	swarm.vm.hostname = "worker-02"
	swarm.vm.network "private_network", ip: "192.168.33.12"
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
		vb.customize [ 'modifyvm', :id, '--name', 'worker-02' ]
  	end
  end
end
