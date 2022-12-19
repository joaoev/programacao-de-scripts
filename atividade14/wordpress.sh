#!/bin/bash

KEY_NAME=$1
MYSQL_USER=$2
MYSQL_PASSWORD=$3

IMAGE_ID="ami-08c40ec9ead489470"
GROUP_NAME="wordpress"

DEFAULT_VPC_ID=$(aws ec2 describe-vpcs \
	--filter "Name=is-default, Values=true" \
	--query "Vpcs[].VpcId" \
	--output text)

SUBNET_FROM_DEFAULT_VPC=$(aws ec2 describe-subnets \
	--filter "Name=vpc-id, Values=${DEFAULT_VPC_ID}" \
	--query "Subnets[0].SubnetId" \
	--output text)

SECURITY_GROUP_ID=$(aws ec2 create-security-group \
	--group-name "${GROUP_NAME}" \
	--description "LAMP Wordpress" \
	--vpc-id ${DEFAULT_VPC_ID} \
	--output text)

PUBLIC_IP=$(curl -s checkip.amazonaws.com)
PUBLIC_IP_CIDR_32=$(echo "${PUBLIC_IP}/32")

aws ec2 authorize-security-group-ingress \
	--group-name "${GROUP_NAME}" \
	--port 22 \
	--protocol tcp \
	--cidr ${PUBLIC_IP_CIDR_32} 1> /dev/null 2>&1

aws ec2 authorize-security-group-ingress \
	--group-name "${GROUP_NAME}" \
	--port 80 \
	--protocol tcp \
	--cidr 0.0.0.0/0 1> /dev/null 2>&1

aws ec2 authorize-security-group-ingress \
	--group-name "${GROUP_NAME}" \
	--port 3306 \
	--protocol tcp \
	--source-group ${SECURITY_GROUP_ID} 1> /dev/null 2>&1

cat<<EOF > mysql_server.sh
#!/bin/bash
apt-get update -y
apt-get install mysql-server -y
sed -ri 's/^bind-address.*=.*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf 
systemctl restart mysql.service

mysql<<EOF
CREATE DATABASE scripts;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON scripts.* TO '${MYSQL_USER}'@'%';
USE scripts;
CREATE TABLE Teste (atividade INT);
quit;
EOF

chmod +x mysql_server.sh

echo "Criando servidor de Banco de Dados..."

INSTACE_MYSQL_SERVER=$(aws ec2 run-instances \
	--image-id ${IMAGE_ID} \
	--instance-type "t2.micro" \
	--key-name "${KEY_NAME}" \
	--security-group-ids ${SECURITY_GROUP_ID} \
	--subnet-id ${SUBNET_FROM_DEFAULT_VPC} \
	--user-data file://mysql_server.sh \
	--query "Instances[0].InstanceId" \
	--output text)

PRIVATE_IP_MYSQL_SERVER=$(aws ec2 describe-instances \
	--instance-id ${INSTACE_MYSQL_SERVER} \
	--query "Reservations[0].Instances[].PrivateIpAddress" \
	--output text)

echo "IP Privado do Banco de Dados: ${PRIVATE_IP_MYSQL_SERVER}"

STATE_INSTACE_MYSQL_SERVER=$(aws ec2 describe-instances \
	--instance-id ${INSTACE_MYSQL_SERVER} \
	--query 'Reservations[*].Instances[*].State.Name' \
	--output text)

while $(test "${STATE_INSTACE_MYSQL_SERVER}" != "running"); do

    STATE_INSTACE_MYSQL_SERVER=$(aws ec2 describe-instances \
	--instance-id ${INSTACE_MYSQL_SERVER} \
	--query 'Reservations[0].Instances[].State.Name' \
	--output text)

	sleep 1;
done;


cat<<EOF > lamp.sh
#!/bin/bash

apt-get update -y

apt-get install apache2 -y

apt-get install mysql-client -y

apt-get install php-mysql php-curl libapache2-mod-php php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

echo -e "[client]
user=${MYSQL_USER}
password=${MYSQL_PASSWORD}" > /home/ubuntu/.my.cnf

cat<<FIM > /etc/apache2/sites-available/wordpress.conf
<Directory /var/www/html/wordpress/>
    AllowOverride All
</Directory>
FIM

a2enmod rewrite
a2ensite wordpress

curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
touch wordpress/.htaccess
cp wordpress/wp-config-sample.php wordpress/wp-config.php
cp -a wordpress/. /var/www/html/wordpress
systemctl restart apache2

echo -e "<?php
define( 'DB_NAME', 'scripts' );
define( 'DB_USER', '${MYSQL_USER}' );
define( 'DB_PASSWORD', '${MYSQL_PASSWORD}' );
define( 'DB_HOST', '${PRIVATE_IP_MYSQL_SERVER}' );
define( 'DB_CHARSET', 'utf8' );\ndefine( 'DB_COLLATE', '' );

\$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)

\\\$table_prefix= 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';" > wp-config.php

cp wp-config.php /var/www/html/wordpress/

chown -R www-data:www-data /var/www/html/wordpress/
find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;

systemctl enable apache2
systemctl restart apache2
EOF

chmod +x lamp.sh

echo 
echo "Criando servidor de Aplicação..."

INSTACE_WORDPRESS=$(aws ec2 run-instances \
	--image-id ${IMAGE_ID} \
	--instance-type "t2.micro" \
	--key-name "${KEY_NAME}" \
	--security-group-ids ${SECURITY_GROUP_ID} \
	--subnet-id ${SUBNET_FROM_DEFAULT_VPC} \
	--user-data file://lamp.sh \
	--query "Instances[0].InstanceId" \
	--output text)

while $(test "${STATE_INSTACE_WORDPRESS}" != "running"); do

    STATE_INSTACE_WORDPRESS=$(aws ec2 describe-instances \
	--instance-id ${INSTACE_WORDPRESS} \
	--query 'Reservations[0].Instances[].State.Name' \
	--output text)

	sleep 1;
done;

PUBLIC_IP_INSTACE_WORDPRESS=$(aws ec2 describe-instances \
	--instance-id ${INSTACE_WORDPRESS} \
	--query "Reservations[0].Instances[].PublicIpAddress" \
	--output text)

sleep 60
echo "IP Público do Servidor de Aplicação: ${PUBLIC_IP_INSTACE_WORDPRESS}"
echo
echo "Acesse http://${PUBLIC_IP_INSTACE_WORDPRESS}/wordpress para finalizar a configuração."
