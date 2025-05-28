#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env
source /root/.bash_profile
log=/root/logs/aztec-validator-add


echo $(date --utc +%FT%TZ) started, waiting $DELAY
sleep $DELAY

response=$(aztec add-l1-validator \
  --l1-rpc-urls $RPC \
  --private-key $PK \
  --attester $WALLET \
  --proposer-eoa $WALLET \
  --staking-asset-handler 0xF739D03e98e23A7B65940848aBA8921fF3bAc4b2 \
  --l1-chain-id 11155111 | head -4)
  

  
