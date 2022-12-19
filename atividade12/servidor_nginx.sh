#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y

echo "<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
        font-family: Arial, sans-serif;
    }
    </style>

    <title>ATIVIDADE 12 - João Evangelista</title>
</head>
<body>
    <p><b>Aluno: João Evangelista de Souza Alves</b></p>
    <p><b>Matrícula: 514262</b></p>
</body>
</html>" > /var/www/html/index.html

sudo service nginx start
