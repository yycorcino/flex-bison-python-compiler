FROM ubuntu:latest

WORKDIR /compiler

COPY . /compiler/

RUN apt-get update -y \
  && apt-get install bison flex make -y
