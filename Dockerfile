FROM louislam/uptime-kuma:2

RUN apt-get update && apt-get install -y curl ca-certificates \
 && curl -L https://github.com/benbjohnson/litestream/releases/latest/download/litestream-linux-amd64 \
    -o /usr/local/bin/litestream \
 && chmod +x /usr/local/bin/litestream

COPY litestream.yml /etc/litestream.yml
COPY run.sh /usr/local/bin/run.sh

EXPOSE ${UPTIME_KUMA_PORT}

CMD [ "/usr/local/bin/run.sh" ]
