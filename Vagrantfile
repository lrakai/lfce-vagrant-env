nodes = [
  { :hostname => "box",   :ip => "10.0.0.100", ssh_host_port: 2221, :box => "centos/7", :ram => 512 },
  { :hostname => "node1", :ip => "10.0.0.101", ssh_host_port: 2222, :box => "centos/7", :ram => 1024 }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network "private_network", ip: node[:ip]
      nodeconfig.vm.network "forwarded_port", guest: 22, host: node[:ssh_host_port], id: "ssh"
      nodeconfig.ssh.insert_key = false # uses vagrant insecure key

      nodeconfig.vm.provision "common", type: "shell", path: "provisioners/common.sh"
      if File.file?("provisioners/#{node[:hostname]}.sh")
        nodeconfig.vm.provision node[:hostname], type: "shell", path: "provisioners/#{node[:hostname]}.sh"
      end

      nodeconfig.vm.provider "virtualbox" do |vb|
        vb.memory = node[:ram]
        vb.cpus = 1

        vb.customize ['storagectl', :id, '--name',  'SATA Controller', '--add', 'sata',  '--controller', 'IntelAhci', '--portcount', 3]
        if node[:hostname] == "box"
          disks = [
            { :path => './tmp/disk1.vdi', :port => 0, :device => 0 },
            { :path => './tmp/disk2.vdi', :port => 1, :device => 0 },
            { :path => './tmp/disk3.vdi', :port => 2, :device => 0 }
          ]
          disks.each do |disk|
            unless File.exist?(disk[:path])
              vb.customize ['createhd', '--filename', disk[:path], '--size', 400]
            end
            vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', disk[:port], '--device', disk[:device], '--type', 'hdd', '--medium', disk[:path]]
          end
        end
      end
    end
  end
end