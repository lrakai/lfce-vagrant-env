nodes=("node1" "node2")

for i in $(seq 0 $(( ${#nodes[@]} - 1 )) ); do
    if ! grep ${nodes[$i]}  /etc/ssh/ssh_config ; then
        echo >> /etc/ssh/ssh_config <<EOF

Host node
    HostName ${nodes[$i]}
    Port 22
    IdentityFile /vagrant/files/insecure_private_key
EOF
    fi
done