FROM alpine:latest
RUN apk update \
    && apk add python3 git
WORKDIR /data
COPY main.py /data/main.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
