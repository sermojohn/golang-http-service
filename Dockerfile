FROM alpine:3.5
RUN set -x \
    && apk --no-cache add \
        ca-certificates \
        shadow \
        tzdata \
    && groupadd -r user \
    && useradd -m -r -g user user \
    && apk del shadow
USER user

ADD out/main /usr/local/bin/service

CMD echo "starting..." && /usr/local/bin/service
