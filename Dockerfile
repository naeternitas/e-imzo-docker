FROM eclipse-temurin:8-jre-jammy

ENV EIMZO_URL=https://dls.soliq.uz/v6.3.5/E-IMZO-v6.3.5.tar.gz

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    bash \
    libx11-6 \
    libxi6 \
    libxtst6 \
    libgtk-3-0 \
    libnss3 \
    libpcsclite1 \
    libccid \
    pcscd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/e-imzo

RUN wget -O e-imzo.tar.gz "${EIMZO_URL}" \
    && tar -xzf e-imzo.tar.gz --strip-components=1 \
    && rm e-imzo.tar.gz \
    && chmod +x E-IMZO.sh

CMD ["bash", "/opt/e-imzo/E-IMZO.sh"]
