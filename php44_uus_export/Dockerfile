FROM ubuntu:latest

MAINTAINER Meelis Valgev�li <meelis82@gmail.com>

LABEL vendor=dockerizedrupal.com

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/entrypoint.sh build

EXPOSE 8002

ENTRYPOINT ["/src/entrypoint.sh", "run"]
