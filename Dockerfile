FROM ubuntu:20.04

RUN apt update && apt install -y yum

WORKDIR /usr/src