FROM docker.io/bitnami/minideb:buster-arm64
LABEL maintainer="Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="arm64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux" \
    PATH="/opt/bitnami/python/bin:/opt/bitnami/java/bin:/opt/bitnami/spark/bin:/opt/bitnami/spark/sbin:/opt/bitnami/common/bin:$PATH"

COPY prebuildfs /
# Install required system packages and dependencies
RUN apt-get update
RUN install_packages acl ca-certificates curl wget gzip libbz2-1.0 libc6 libffi6 libgcc1 liblzma5 libncursesw6 libreadline7 libsqlite3-0 libssl1.1 libstdc++6 libtinfo6 procps tar zlib1g apt-transport-https gnupg locate

RUN apt-get update
RUN apt-get install python3 -y
RUN . /opt/bitnami/scripts/install_jdk8.sh
RUN . /opt/bitnami/scripts/install_spark.sh
RUN set -eux; \
	apt-get update; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install libnss-wrapper -y

RUN chmod g+rwX /opt/bitnami

COPY rootfs /
RUN /opt/bitnami/scripts/spark/postunpack.sh
ENV BITNAMI_APP_NAME="spark" \
    BITNAMI_IMAGE_VERSION="3.1.2-debian-10-r54" \
    #JAVA_HOME="/usr/bin/java" \
    LD_LIBRARY_PATH="/opt/bitnami/python/lib/:/opt/bitnami/spark/venv/lib/python3.6/site-packages/numpy.libs/:$LD_LIBRARY_PATH" \
    #LIBNSS_WRAPPER_PATH="/opt/bitnami/common/lib/libnss_wrapper.so" \
    LIBNSS_WRAPPER_PATH="/usr/lib/libnss_wrapper.so" \
    NSS_WRAPPER_GROUP="/opt/bitnami/spark/tmp/nss_group" \
    NSS_WRAPPER_PASSWD="/opt/bitnami/spark/tmp/nss_passwd" \
    SPARK_HOME="/opt/bitnami/spark"

WORKDIR /opt/bitnami/spark
USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/spark/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/spark/run.sh" ]