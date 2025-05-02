#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source /root/.bash_profile
source $path/env

aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls $RPC  \
  --l1-consensus-host-urls $BEACON \
  --sequencer.validatorPrivateKey $PK \
  --sequencer.coinbase $WALLET \
  --p2p.p2pIp $IP
