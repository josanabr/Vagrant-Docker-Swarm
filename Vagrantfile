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
	swarm.vm.network "private_network", ip: "192.168.56.10"
        swarm.vm.network "forwarded_port", guest: 80, host: 8008
        swarm.vm.provision "shell" do |s| 
          s.path = "setup_swarm.sh"
          s.args = ["manager"]
        end
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'swarm-manager' ]
  	end
#    swarm.vm.synced_folder "/home/john/Src/docker-compose/Fisher", "/Fisher"
  end
  config.vm.define "worker-01" do |swarm|
  	swarm.vm.hostname = "worker-01"
	swarm.vm.network "private_network", ip: "192.168.56.11"
        swarm.vm.provision "shell" do |s| 
          s.path = "setup_swarm.sh"
          s.args = ["worker-01"]
        end
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'swarm-worker-01' ]
  	end
  end
  config.vm.define "worker-02" do |swarm|
  	swarm.vm.hostname = "worker-02"
	swarm.vm.network "private_network", ip: "192.168.56.12"
        swarm.vm.provision "shell" do |s| 
          s.path = "setup_swarm.sh"
          s.args = ["worker-02"]
        end
  	swarm.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'swarm-worker-02' ]
  	end
  end
end
