FROM arm64v8/ubuntu:20.04

ENV \
   DEBIAN_FRONTEND=noninteractive \
   GLIBC_VERSION=2.32 \
   PREFIX_DIR=/usr/glibc-compat

RUN \
   apt-get -q update && apt-get -qy install \
   bison \
   build-essential \
   gawk \
   gettext \
   openssl \
   python3 \
   texinfo \
   wget

COPY glibc-build/configparams /glibc-build/configparams
COPY glibc-build/builder.sh /builder
RUN chmod +x /builder

ENTRYPOINT ["/builder"]
