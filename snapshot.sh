path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env

cd $path
./stop.sh

rm -r /root/.aztec/alpha-testnet/data/*
cd /root/.aztec/alpha-testnet/data
wget https://snapshots.theamsolutions.info/aztec-data.tar
tar xf aztec-data.tar
rm aztec-data.tar

cd $path
./start-service.sh
