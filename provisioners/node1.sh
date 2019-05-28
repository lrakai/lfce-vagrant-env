yum install -y nc at
systemctl enable atd
systemctl start atd
echo "nc -l 779 -k" | at now # cause port collision
