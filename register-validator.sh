#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env
source /root/.bash_profile

aztec add-l1-validator \
  --l1-rpc-urls $RPC \
  --private-key $PK \
  --attester $WALLET \
  --proposer-eoa $WALLET \
  --staking-asset-handler 0xF739D03e98e23A7B65940848aBA8921fF3bAc4b2 \
  --l1-chain-id 11155111
