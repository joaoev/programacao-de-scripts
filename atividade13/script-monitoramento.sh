#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y
sudo service nginx start

cat << 'EOF' > script-monitoramento.sh
#!/bin/bash

while true; do
    
    DATE_AND_TIME=$(date +%H:%M:%S - %d/%m/%y)
    UPTIME=$(uptime -p | cut -d " " -f2-)
    LOAD_AVERAGE=$(uptime | awk '{print "1min "$9" 5min "$10" 15min "$11}')
    MEMORY_FREE=$(free -h | awk 'NR==2 {print $4}')
    MEMORY_USED=$(free -h | awk 'NR==2 {print $3}')
    RECEIVED_BYTES=$(cat /proc/net/dev | grep eth0 | awk '{print $2}')
    TRANSMIT_BYTES=$(cat /proc/net/dev | grep eth0 | awk '{print $10}')

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

                table {
                    border: 1px solid;
                    border-collapse: collapse;
                    padding: 5px;
                    margin: auto auto;
                    font-size: 14px;
                }

                table th {
                    border: 1px solid;
		    text-align: center;
                    padding: 16px;
                }

                table td {
                    border: 1px solid;
                    text-align: center;
                    padding: 16px;
                }
            </style>

            <title>ATIVIDADE 13 - Servidor de Monitoramento - João Evangelista</title>
        </head>
        <body>
            
            <center><h1>Servidor de Monitoramento</h1></center>
            <table>
                <thead>
                    <tr>
                        <th>DATA E HORA</th>
                        <th>TEMPO ATIVA</th>
                        <th>CARGA MÉDIA DO SISTEMA</th>
                        <th>MEMÓRIA LIVRE</th>
                        <th>MEMÓRIA USADA</th>
                        <th>BYTES RECEBIDOS(eth0)</th>
                        <th>BYTES ENVIADOS(eth0)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${DATE_AND_TIME}</td>
                        <td>${UPTIME}</td>
                        <td>${LOAD_AVERAGE}</td>
                        <td>${MEMORY_FREE}</td>
                        <td>${MEMORY_USED}</td>
                        <td>${RECEIVED_BYTES}</td>
                        <td>${TRANSMIT_BYTES}</td>
                    </tr>
                </tbody>
            </table>

        </body>
        </html>" > /var/www/html/index.html
    sleep 5
done
EOF

cat << 'EOF' > script-monitoramento.service
[Unit]
After=network.target

[Service]
ExecStart=/usr/local/bin/script-monitoramento.sh

[Install]
WantedBy=default.target
EOF

cp script-monitoramento.sh /usr/local/bin/
cp script-monitoramento.service /etc/systemd/system/

chmod 744 /usr/local/bin/script-monitoramento.sh
chmod 664 /etc/systemd/system/script-monitoramento.service

systemctl daemon-reload
systemctl enable script-monitoramento.service
systemctl start script-monitoramento.service
