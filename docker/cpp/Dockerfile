FROM ubuntu:20.10

WORKDIR /workspace

RUN apt-get -y update && apt-get install -y \
    make \
    sudo

COPY Makefile Makefile

RUN make install
