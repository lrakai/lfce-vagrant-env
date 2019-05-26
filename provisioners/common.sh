yum install -y epel-release

if [ ! -d /root/.ssh ]; then
    mkdir /root/.ssh
fi
if ! grep insecure /root/.ssh/authorized_keys ; then
    insecure_public_key=$(ssh-keygen -y -f /vagrant/files/insecure_private_key)
    echo "$insecure_public_key vagrant insecure public key" >> /root/.ssh/authorized_keys
fi

nodes=("node1" "node2")
ips=("10.0.0.101" "10.0.0.102")

for i in $(seq 0 $(( ${#nodes[@]} - 1 )) ); do
    if ! grep ${nodes[$i]} /etc/hosts ; then
        echo "${ips[$i]} ${nodes[$i]} " >> /etc/hosts
    fi
done