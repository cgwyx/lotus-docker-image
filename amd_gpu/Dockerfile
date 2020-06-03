FROM docker.io/mslovy/lotus:intel_gpu

RUN cd /lotus \
  && FFI_BUILD_FROM_SOURCE=1 RUSTFLAGS='-C target-cpu=native' make clean all bench \
  && make install

WORKDIR /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
