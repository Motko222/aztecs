#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd)
folder=$(echo $path | awk -F/ '{print $NF}')
cd $path
source $path/env

if [ -z $1 ] 
then
 c=$(cat rpc | wc -l)
 echo "------------------------"
 for (( i=1;i<=$c;i++ ))
 do
   rpc=$(cat rpc | head -$i | tail -1)
   printf "%s %-60s %s \n" $i $rpc
 done

 echo "------------------------"
 read -p "? " n

 if [[ $n == ?(-)+([0-9]) ]]
  then
    rpc=$(cat rpc | head -$n | tail -1 )
  else 
    exit 1
 fi

else
 rpc=$1
fi

rpc2=$(echo $rpc | sed 's/\//\\\//g')
sed -i 's/^RPC.*/RPC="'$rpc2'"/' env
