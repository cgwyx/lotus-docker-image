FROM docker.io/mslovy/lotus:intel

ENV PATH="~/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn

COPY cargo.config ~/.cargo/config

RUN cd /lotus \
  && FFI_BUILD_FROM_SOURCE=1 RUSTFLAGS='-C target-cpu=native' make clean all bench \
  && make install

WORKDIR /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
