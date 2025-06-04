path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env

read -p "Version? " version

cd /root/.aztec/bin
./aztec-up -v $version
