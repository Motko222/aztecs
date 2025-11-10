#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source /root/.bash_profile
source $path/env

cd /root/.aztec/bin
./aztec start --node --archiver --sequencer \
  --network testnet \
  --l1-rpc-urls $RPC  \
  --l1-consensus-host-urls $BEACON \
  --sequencer.validatorPrivateKeys $PK_NEW \
  --sequencer.coinbase $WALLET \
  --p2p.p2pIp $IP
