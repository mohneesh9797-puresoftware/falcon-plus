# Build container;
FROM jimmytinsley/makegcc-golang:latest
LABEL maintainer laiwei.ustc@gmail.com
USER root

ENV FALCON_DIR=/mohneesh9797-puresoftware PROJ_PATH=${GOPATH}/src/github.com/mohneesh9797-puresoftware/falcon-plus

RUN mkdir -p $FALCON_DIR && \
    mkdir -p $FALCON_DIR/logs && \
    apk add --no-cache ca-certificates bash git supervisor
COPY . ${PROJ_PATH}

WORKDIR ${PROJ_PATH}
RUN make all \
    && make pack4docker \
    && tar -zxf mohneesh9797-puresoftware-v*.tar.gz -C ${FALCON_DIR} \
    && rm -rf ${PROJ_PATH}

# Final container;
FROM alpine:3.7
LABEL maintainer laiwei.ustc@gmail.com
USER root

ENV FALCON_DIR=/mohneesh9797-puresoftware

RUN mkdir -p $FALCON_DIR/logs && \
    apk add --no-cache ca-certificates bash git supervisor

ADD docker/supervisord.conf /etc/supervisord.conf

COPY --from=0 ${FALCON_DIR} ${FALCON_DIR}

EXPOSE 8433 8080
WORKDIR ${FALCON_DIR}

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
