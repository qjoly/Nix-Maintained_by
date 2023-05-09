FROM alpine:latest
RUN apk update \
    && apk add python3
WORKDIR /data
COPY main.py /data/main.py
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
