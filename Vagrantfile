Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "box"
  config.vm.network "private_network", ip: "10.0.0.100"
  config.ssh.password = ""

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "1"
  end
end