#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd)
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env
cd $path

aztec \
  add-l1-validator \
  --l1-rpc-urls $RPC \
  --network testnet \
  --private-key $PK \
  --attester $ETH_ATTESTER_ADDRESS \
  --withdrawer $WALLET \
  --bls-secret-key $BLS_ATTESTER_PRIV_KEY \
  --rollup 0xebd99ff0ff6677205509ae73f93d0ca52ac85d67
