#!/bin/bash

cd aws-vpc_back

terraform init

sleep 5s
terraform apply --var-file example.tfvars -auto-approve  >> output.txt

sleep 10s

cat output.txt | grep subnet_id | awk {'print $4'} | sed 's/^.//' | cut -d '"' -f1  >> /root/kube-scripts/out.txt

>output.txt

cd ..

echo "wait"

sleep 5s

cd aws-kube_back

touch 1.txt
touch 2.txt
touch 3.txt

sleep 3s

echo "temp file created"

sed -n 1p /root/kube-scripts/out.txt  > 1.txt 

cat 1.txt | while read -r line; do  sed -i "s|MASTER|$line|g" example.tfvars; rm -rf 1.txt;  done

sed -n 2p /root/kube-scripts/out.txt  > 2.txt 

cat 2.txt | while read -r line; do  sed -i "s|NODE1|$line|g" example.tfvars; rm -rf 2.txt; done

sed -n 3p /root/kube-scripts/out.txt  > 3.txt 

cat 3.txt | while read -r line; do  sed -i "s|NODE2|$line|g" example.tfvars; rm -rf 3.txt; done

sleep 5s

echo "replaced"

sleep 20s

terraform init

sleep 5s

terraform apply --var-file example.tfvars -auto-approve


cd ..

echo " Please wait !!! .. Your Environment is getting ready"

>out.txt

sleep 180s

scp -o StrictHostKeyChecking=no centos@matha-kubernetes.offersatkochi.com:/home/centos/kubeconfig  /root/.kube/config

echo "The Environment is ready!!!"
