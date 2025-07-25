path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env

#install 
cd /root
bash -i <(curl -s https://install.aztec.network)
cd /root/.aztec/bin
./aztec-up latest

#create env
cd $path
[ -f env ] || cp env.sample env
nano env

#create service
printf "[Unit]
Description=$folder node
After=network.target
Wants=network-online.target

[Service]
EnvironmentFile=/root/scripts/$folder/env
User=root
Group=root
ExecStart=/root/scripts/$folder/start-cli.sh
Restart=always
RestartSec=30
LimitNOFILE=65536
LimitNPROC=4096
StandardOutput=journal
StandardError=journal
SyslogIdentifier=$folder
WorkingDirectory=/root/.aztec

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/$folder.service

sudo systemctl daemon-reload
sudo systemctl enable $folder
