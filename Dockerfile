FROM louislam/uptime-kuma:2

RUN apt-get update && apt-get install -y curl ca-certificates
 RUN curl -L "https://github.com/benbjohnson/litestream/releases/download/v0.5.5/litestream-0.5.5-linux-x86_64.deb" \
    -o /tmp/litestream.deb \
 && dpkg -i /tmp/litestream.deb \
 && rm /tmp/litestream.deb 

COPY litestream.yml /etc/litestream.yml
COPY run.sh /usr/local/bin/run.sh

EXPOSE ${UPTIME_KUMA_PORT}

CMD [ "/usr/local/bin/run.sh" ]
