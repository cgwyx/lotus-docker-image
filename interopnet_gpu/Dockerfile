FROM docker.io/mslovy/lotus:intel_gpu

ENV PATH="~/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn

COPY cargo.config ~/.cargo/config

RUN cd /lotus \
  && git config --global user.email "zay11022@gmail.com" \
  && git config --global user.name "Ning Yao" \
  && git stash \
  && git fetch origin \
  && git checkout interopnet \
  && git rebase origin/interopnet \
  && git stash pop \
  && make clean all bench \
  && make install

WORKDIR /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
