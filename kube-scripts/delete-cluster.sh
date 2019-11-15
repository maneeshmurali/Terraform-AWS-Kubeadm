#!/bin/bash

cd aws-kube

terraform destroy --var-file example.tfvars -auto-approve

sleep 20s

cp example.tfvars_orj  example.tfvars

cd ..

cd aws-vpc

terraform destroy --var-file example.tfvars -auto-approve

sleep 20s
