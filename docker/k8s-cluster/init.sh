#!/bin/sh

apk add --no-cache ca-certificates git bash \
&& make all \
&& make pack4docker \
&& tar -zxf mohneesh9797-puresoftware-v*.tar.gz -C build \
&& rm mohneesh9797-puresoftware-v*.tar.gz