path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env

read -p "Version (latest)? " version

cd $path
./stop.sh

cd /root/.aztec/bin
[ -z $version ] && ./aztec-up latest || ./aztec-up -v $version

cd $path
./start-service.sh
