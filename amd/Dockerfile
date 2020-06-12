FROM 172.168.0.145:5000/lotus:intel

ENV PATH="~/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn

COPY cargo.config /root/.cargo/config

RUN cd /lotus \
  && cat ~/.cargo/config \
  && FFI_BUILD_FROM_SOURCE=1 RUSTFLAGS='-C target-cpu=native' make clean deps \
  && FFI_BUILD_FROM_SOURCE=1 RUSTFLAGS='-C target-cpu=native' make clean all bench \
  && make install

WORKDIR /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
