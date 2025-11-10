#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd)
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env
cd $path

cast send 0x139d2a7a0881e16332d7D1F8DB383A4507E1Ea7A "approve(address,uint256)" 0xebd99ff0ff6677205509ae73f93d0ca52ac85d67 200000ether \
 --private-key "$PK" --rpc-url $RPC
