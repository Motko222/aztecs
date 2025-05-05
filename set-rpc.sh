#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd)
folder=$(echo $path | awk -F/ '{print $NF}')
cd $path
source env
c=$(cat rpc | wc -l)

echo "------------------------"
for (( i=1;i<$c;i++ ))
do
   rpc=$(cat rpc | head -$i | tail -1)
   height=$(curl -sX POST $rpc -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"zgs_getStatus","params":[],"id":1}' | jq -r .result.logSyncHeight)
   printf "%s %-60s %s \n" $i $rpc $height)
done

echo "------------------------"
read -p "? " n

if [[ $n == ?(-)+([0-9]) ]]
  then
    rpc=$(cat rpc | head -$n | tail -1 )
  else 
    exit 1
fi

sed -i 's/^blockchain_rpc_endpoint.*/blockchain_rpc_endpoint = \"'$rpc'\"/' config.toml
