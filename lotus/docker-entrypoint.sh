#!/bin/bash

: ${CUSTOM_GPU:="GeForce RTX 2080 Ti:4352"}
: ${ADDRESS:="127.0.0.1:2345"}
: ${daemon:="seal-worker"}

mkdir -p /storage/lotuswork/lotusstorage \
  && mkdir -p /storage/lotuswork/lotus \
  && mkdir -p /storage/lotuswork/lotusworker \
  && mkdir -p /storage/filecoin-proof-parameters \
  && mkdir -p /storage/lotuswork/tmpdir

export BELLMAN_CUSTOM_GPU=${CUSTOM_GPU}

if [ x"$daemon" == x"seal-worker" ];then
  lotus-seal-worker run --address ${ADDRESS}
elif [x"$dameon" == x"miner-storage" ];then
  lotus-storage-miner run
elif [x"$daemon" == x"dev"];then
while :
do
    sleep 3600
done
fi

