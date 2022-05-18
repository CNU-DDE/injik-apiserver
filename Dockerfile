FROM amazonlinux:2

LABEL name="Haeram Kim"
LABEL email="haeram.kim1@gmail.com"
LABEL image_version="1.0.0"
LABEL app_version="1.8.3"
LABEL description="Klaytn endpoint node process packaged by injik"

ARG VERSION=v1.8.3 OS_ARCH=amd64 OS_NAME=linux ROOT=/

RUN yum install -y tar gzip procps
RUN curl -LO https://packages.klaytn.net/klaytn/${VERSION}/ken-${VERSION}-0-${OS_NAME}-${OS_ARCH}.tar.gz
RUN tar -xvzf ${ROOT}/ken-${VERSION}-0-${OS_NAME}-${OS_ARCH}.tar.gz
RUN rm -v ${ROOT}/ken-${VERSION}-0-${OS_NAME}-${OS_ARCH}.tar.gz
WORKDIR ${ROOT}/ken-${OS_NAME}-${OS_ARCH}
COPY kend.conf conf/kend.conf
RUN mkdir -pv data

EXPOSE 32323 8551 8552 50505
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod 711 *.sh
ENTRYPOINT [ "./docker-entrypoint.sh" ]
