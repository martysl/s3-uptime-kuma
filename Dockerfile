FROM louislam/uptime-kuma:2

RUN apt-get update && apt-get install -y curl ca-certificates
 RUN curl -L "https://github.com/benbjohnson/litestream/releases/download/v0.5.5/litestream-vfs-v0.5.5-linux-amd64.tar.gz" \
    -o /tmp/litestream-vfs.tar.gz \
 && tar -xzf /tmp/litestream-vfs.tar.gz -C /usr/local/bin && chmod +x /usr/local/bin/litestream

COPY litestream.yml /etc/litestream.yml
COPY run.sh /usr/local/bin/run.sh

EXPOSE ${UPTIME_KUMA_PORT}

CMD [ "/usr/local/bin/run.sh" ]
