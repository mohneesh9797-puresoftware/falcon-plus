FROM alpine:3.7
LABEL maintainer tabsp@qq.com
USER root

ENV FALCON_DIR=/mohneesh9797-puresoftware
# agent
RUN apk add --no-cache ca-certificates git curl
# alarm
ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip

COPY build/%%MODULE_NAME%% ${FALCON_DIR}/%%MODULE_NAME%%
WORKDIR ${FALCON_DIR}

CMD ["/mohneesh9797-puresoftware/%%MODULE_NAME%%/bin/falcon-%%MODULE_NAME%%", "-c", "/mohneesh9797-puresoftware/%%MODULE_NAME%%/config/cfg.json"]
