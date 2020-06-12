FROM docker.io/mslovy/lotus:intel

ENV PATH="~/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#ENV GO111MODULE=on
#ENV GOPROXY=https://goproxy.cn

#COPY cargo.config /root/.cargo/config

RUN cd /lotus \ 
  && git config --global user.email "zay11022@gmail.com" && git config --global user.name "Ning Yao" \
  && git remote add mslovy https://github.com/mslovy/lotus.git \
  && git fetch mslovy \
  && git fetch origin \
  && git stash \
  && git checkout -b interopnet origin/interopnet \
  && git merge mslovy/interopnet \
  && make clean all bench \
  && make install

WORKDIR /storage

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
