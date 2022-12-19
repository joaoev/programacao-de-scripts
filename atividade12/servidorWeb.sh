#!/bin/bash

echo "Criando servidor..."

KEY_NAME=$1
IMAGE_ID="ami-08c40ec9ead489470"
DEFAULT_VPC_ID=$(aws ec2 describe-vpcs --filter "Name=is-default, Values=true" --query "Vpcs[0].VpcId" --output text)
SUBNET_FROM_DEFAULT_VPC=$(aws ec2 describe-subnets --filter "Name=vpc-id, Values=${DEFAULT_VPC_ID}" --query "Subnets[0].SubnetId" --output text)
SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name "Servidor Web NGINX" --description "Criado para o servidor web NGINX." --vpc-id ${DEFAULT_VPC_ID} --output text)

RULE_HTTP=$(aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 80 --cidr 0.0.0.0/0)
RULE_SSH=$(aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr 0.0.0.0/0)

INSTACE_ID=$(aws ec2 run-instances --image-id ${IMAGE_ID} --instance-type "t2.micro" --key-name "${KEY_NAME}" --security-group-ids ${SECURITY_GROUP_ID} --subnet-id ${SUBNET_FROM_DEFAULT_VPC} --user-data file://servidor_nginx.sh --query "Instances[0].InstanceId" --output text)

PUBLIC_IP=$(aws ec2 describe-instances --instance-id ${INSTACE_ID} --query "Reservations[0].Instances[].PublicIpAddress" --output text)

sleep 90

echo "Acesse: http://${PUBLIC_IP}/"
