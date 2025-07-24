#!/bin/bash

path=$(cd -- $(dirname -- "${BASH_SOURCE[0]}") && pwd) 
folder=$(echo $path | awk -F/ '{print $NF}')
source $path/env
source /root/.bash_profile
log=/root/logs/aztec-validator-add-output
msg=/root/logs/aztec-validator-add-message

echo $MACHINE $folder >$msg
echo $(date --utc +%FT%TZ) starting script with delay $DELAY >>$msg
sleep $DELAY

aztec add-l1-validator \
  --l1-rpc-urls $RPC \
  --private-key $PK \
  --attester $WALLET \
  --staking-asset-handler 0xF739D03e98e23A7B65940848aBA8921fF3bAc4b2 \
  --l1-chain-id 11155111 1>$log 2>$log

cat $log | grep -E "INFO|ERROR" | head -2 | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | cut -c 1-100 >>$msg

#send tg message
[ -z $TG_URL ] || curl $TG_URL --data "chat_id=-$TG_CHATID" --data-urlencode "text=$(cat $msg)"
