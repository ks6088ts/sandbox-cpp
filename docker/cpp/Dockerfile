FROM ubuntu:20.10

WORKDIR /workspace

ARG http_proxy=""
ARG https_proxy=""

RUN apt-get -y update && apt-get install -y \
    make \
    sudo \
    tzdata

ENV TZ=Asia/Tokyo

COPY Makefile Makefile

RUN make install
