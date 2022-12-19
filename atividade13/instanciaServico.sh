#!/bin/bash

echo "Criando servidor de Monitoramento..."

KEY_NAME=$1
IMAGE_ID="ami-08c40ec9ead489470"
DEFAULT_VPC_ID=$(aws ec2 describe-vpcs --filter "Name=is-default, Values=true" --query "Vpcs[0].VpcId" --output text)
SUBNET_FROM_DEFAULT_VPC=$(aws ec2 describe-subnets --filter "Name=vpc-id, Values=${DEFAULT_VPC_ID}" --query "Subnets[0].SubnetId" --output text)
SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name "Servidor de Monitoramento" --description "Servidor de Monitoramento" --vpc-id ${DEFAULT_VPC_ID} --output text)

aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 80 --cidr 0.0.0.0/0 1> /dev/null 2>&1
aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr 0.0.0.0/0 1> /dev/null 2>&1

INSTACE_ID=$(aws ec2 run-instances --image-id ${IMAGE_ID} --instance-type "t2.micro" --key-name "${KEY_NAME}" --security-group-ids ${SECURITY_GROUP_ID} --subnet-id ${SUBNET_FROM_DEFAULT_VPC} --user-data file://script-monitoramento.sh --query "Instances[0].InstanceId" --output text)

PUBLIC_IP=$(aws ec2 describe-instances --instance-id ${INSTACE_ID} --query "Reservations[0].Instances[].PublicIpAddress" --output text)

sleep 60

echo "Acesse: http://${PUBLIC_IP}/"
