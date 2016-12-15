FROM rayyildiz/base

MAINTAINER Ramazan AYYILDIZ <rayyildiz@gmail.com>

ENV LANG     C.UTF-8
ENV LC_ALL   C.UTF-8
ENV LANGUAGE C.UTF-8

RUN apk --update add bash

RUN adduser -D -h /home/ghc -s /bin/bash ghc
# RUN echo "ghc ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ghc && chmod 0440 /etc/sudoers.d/ghc
ENV HOME /home/ghc
WORKDIR /home/ghc

ENV PATH ${PATH}:/home/ghc/.cabal/bin
COPY mitch.tishmack@gmail.com-55881c97.rsa.pub /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub

RUN echo "https://s3-us-west-2.amazonaws.com/alpine-ghc/7.10" >> /etc/apk/repositories && \
     apk add --no-cache ghc cabal stack

USER ghc
