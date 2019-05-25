Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "box"
  config.vm.network "private_network", ip: "10.0.0.100"
  config.vm.network "forwarded_port", guest: 22, host: 2221, id: "ssh"
  config.ssh.insert_key = false
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end
end