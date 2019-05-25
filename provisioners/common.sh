yum install -y epel-release

nodes=("node1" "node2")
ips=("10.0.0.101" "10.0.0.102")

for i in $(seq 0 $(( ${#nodes[@]} - 1 )) ); do
    if ! grep ${nodes[$i]} /etc/hosts ; then
        echo "${ips[$i]} ${nodes[$i]} " >> /etc/hosts
    fi
done