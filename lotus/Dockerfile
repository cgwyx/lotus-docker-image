FROM ubuntu:18.04

RUN mkdir -p /storage/lotuswork/lotusstorage \
  && mkdir -p /storage/lotuswork/lotus \
  && mkdir -p /storage/lotuswork/lotusworker \
  && mkdir -p /storage/filecoin-proof-parameters \
  && mkdir -p /storage/lotuswork/tmpdir

ENV LOTUS_STORAGE_PATH /storage/lotuswork/lotusstorage
ENV LOTUS_PATH /storage/lotuswork/lotus
ENV WORKER_PATH /storage/lotuswork/lotusworker
ENV FIL_PROOFS_PARAMETER_CACHE /storage/filecoin-proof-parameters
ENV IPFS_GATEWAY https://proof-parameters.s3.cn-south-1.jdcloud-oss.com/ipfs/
ENV TMPDIR /storage/lotuswork/tmpdir

RUN apt update \
  && apt install vim iproute2 software-properties-common -y

RUN add-apt-repository ppa:longsleep/golang-backports \
  && apt update \
  && apt install golang-go gcc git bzr jq pkg-config mesa-opencl-icd ocl-icd-opencl-dev cargo llvm clang opencl-headers -y

RUN curl https://sh.rustup.rs -sSf | sh

RUN git clone https://github.com/filecoin-project/lotus.git

RUN cd lotus/ \
  && make clean && make all \
  && make install

SHELL ["/bin/bash"]
