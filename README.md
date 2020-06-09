# lotus-docker-images

lotus-docker images provide docker images to run lotus, lotus-storage-miner, lotus-seal-worker easily.

# How To Use It

Docker images will be automatically built on hub.docker.com, anyone can pull images from https://hub.docker.com/r/mslovy/lotus . Docker hub can only automatically build images for intel platform. While if someone use amd platform to accelerate precommit1, you need to rebuild an amd platform image from intel platform images.

## Run a Storage Miner

```
docker run --name worker -d --net host --privileged -e FULLNODE_API_INFO="{{ full_node_jwt_token }}:/ip4/{{ full_node_interface_address }}/tcp/{{ full_node_port }}/http" -v {{ filecoin-proof-parameters_dir }}:/storage/filecoin-proof-parameters -v {{ worker_dir }}:/storage/lotuswork -e ADDRESS={{ storage_miner_interface_address }}:{{ storage_miner_port }} -e daemon=storage-miner mslovy/lotus:intel
```

## Run a Seal Worker

```
docker run --name worker -d --net host --privileged -e STORAGE_API_INFO="{{ storage_miner_jwt_token }}:/ip4/{{ storage_miner_interface_address }}/tcp/{{ storage_miner_port }}/http" -v {{ filecoin-proof-parameters_dir }}:/storage/filecoin-proof-parameters -v {{ worker_dir }}:/storage/lotuswork -e ADDRESS={{ seal_worker_interface_address }}:{{ seal_worker_port }} -e options="--precommit1=false --precommit2=true --commit=true --no-local-storage=false" -e daemon=seal-worker mslovy/lotus:intel
```

```
docker run --name worker -d --net host --privileged -e STORAGE_API_INFO="{{ storage_miner_jwt_token }}:/ip4/{{ storage_miner_interface_address }}/tcp/{{ storage_miner_port }}/http" -v {{ filecoin-proof-parameters_dir }}:/storage/filecoin-proof-parameters -v {{ worker_dir }}:/storage/lotuswork -e ADDRESS={{ seal_worker_interface_address }}:{{ seal_worker_port }} -e options="--precommit1=true --precommit2=false --commit=false --no-local-storage=false" -e daemon=storage-miner mslovy/lotus:amd
```

## Run with a Devlopping Mode

```
docker run --name worker -d --net host --privileged -e STORAGE_API_INFO="{{ storage_miner_jwt_token }}:/ip4/{{ storage_miner_interface_address }}/tcp/{{ storage_miner_port }}/http" -v {{ filecoin-proof-parameters_dir }}:/storage/filecoin-proof-parameters -v {{ worker_dir }}:/storage/lotuswork -e daemon=dev mslovy/lotus:intel
```

# How To Build Images

Prerequiste

* Docker should be installed

Build Images
```
git clone https://github.com/mslovy/lotus-docker-image.git
cd lotus-docker-image
docker build -t {{ local_register_address }}:5000/lotus:amd -f amd/Dockerfile .
```
