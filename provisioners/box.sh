sed -i "s/.*StrictHostKeyChecking.*/StrictHostKeyChecking no/" /etc/ssh/ssh_config

nodes=("node1" "node2")

for i in $(seq 0 $(( ${#nodes[@]} - 1 )) ); do
    if ! grep -q ${nodes[$i]} /etc/ssh/ssh_config ; then
        cat >> /etc/ssh/ssh_config <<EOF

Host ${nodes[$i]}
    HostName ${nodes[$i]}
    Port 22
    IdentityFile /vagrant/files/insecure_private_key
EOF
    fi
done