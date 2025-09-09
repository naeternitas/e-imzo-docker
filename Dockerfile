FROM alpine:3.20

# Прямой URL на E-IMZO
ENV EIMZO_URL=https://dls.yt.uz/E-IMZO-v4.73.tar.gz

RUN apk add --no-cache \
    openjdk8 \
    pcsc-lite pcsc-lite-libs ccid \
    bash wget tar libc6-compat ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV JAVA_TOOL_OPTIONS="-Dsun.security.smartcardio.library=/usr/lib/libpcsclite.so.1"

WORKDIR /opt/e-imzo

RUN echo "Скачиваем: ${EIMZO_URL}" \
    && wget -O e-imzo.tar.gz "${EIMZO_URL}" --no-check-certificate  \
    && tar -xzf e-imzo.tar.gz --strip-components=1 \
    && rm e-imzo.tar.gz \
    && chmod +x /opt/e-imzo/E-IMZO.sh

CMD ["/opt/e-imzo/E-IMZO.sh"]
