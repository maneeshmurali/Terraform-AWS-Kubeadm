#!/bin/bash

echo "Enter your Region"

read reg 

echo "Enter your First Zone"

read zonea

echo "Enter your Second Zone"

read zoneb

echo "Enter your Third Zone"

read zonec

echo "Enter your clustername"

read name

echo "Enter your Mater Instance Type"

read masterinsta

echo "Enter your Node Instance Type"

read nodeinsta

echo "Enter you vpc name"

read vpc

echo " Enter minimum node count"

read mcount

echo " Enter maximum Node count"

read ncount

sed -i "s|REG|$reg|g" aws-vpc_back/example.tfvars
sed -i "s|VPCNAME|$vpc|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEA|$zonea|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEB|$zoneb|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEC|$zonec|g" aws-vpc_back/example.tfvars


sed -i "s|REG|$reg|g" aws-kube_back/example.tfvars
sed -i "s|MIN|$mcount|g" aws-kube_back/example.tfvars
sed -i "s|MAX|$ncount|g" aws-kube_back/example.tfvars
sed -i "s|NAME|$name|g" aws-kube_back/example.tfvars
sed -i "s|MASTERTYPE|$masterinsta|g" aws-kube_back/example.tfvars
sed -i "s|NODETYPE|$nodeinsta|g" aws-kube_back/example.tfvars
sed -i "s|REG|$reg|g" aws-kube_back/variables.tf
sed -i "s|MASTERTYPE|$masterinsta|g" aws-kube_back/variables.tf
sed -i "s|NODETYPE|$nodeinsta|g" aws-kube_back/variables.tf
