#!/bin/bash

: ${CUSTOM_GPU:="GeForce RTX 2080 Ti:4352"}

mkdir -p /storage/lotuswork/lotusstorage \
  && mkdir -p /storage/lotuswork/lotus \
  && mkdir -p /storage/lotuswork/lotusworker \
  && mkdir -p /storage/filecoin-proof-parameters \
  && mkdir -p /storage/lotuswork/tmpdir

export BELLMAN_CUSTOM_GPU=${CUSTOM_GPU}

while :
do
    sleep 3600
done
