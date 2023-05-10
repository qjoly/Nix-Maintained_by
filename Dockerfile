FROM alpine:latest
RUN apk update \
    && apk add python3
WORKDIR /data
COPY main.py /data/main.py
COPY entrypoint.sh /data/entrypoint.sh
RUN chmod +x /data/entrypoint.sh
ENTRYPOINT [ "/data/entrypoint.sh" ]
