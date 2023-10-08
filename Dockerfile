ARG BASEIMAGE_TAG='3.18'

FROM alpine:${BASEIMAGE_TAG}

RUN set -ex && \
  apk update && \
  apk add --no-cache --virtual .runtime-deps \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    bash \
    curl \
    git \
    p7zip \
    postgresql-client && \
  echo 'shopt -s globstar' >> ~/.bashrc && \
  echo 'alias ..="cd .."' >> ~/.bashrc && \
  echo 'alias l="ls -CF --group-directories-first --color=auto"' >> ~/.bashrc && \
  echo 'alias ll="ls -lFh --group-directories-first --color=auto"' >> ~/.bashrc && \
  echo 'alias lla="ls -laFh --group-directories-first  --color=auto"' >> ~/.bashrc && \
  rm -rf /tmp/*

ENTRYPOINT [ "/bin/bash", "-c"]

# Labels ######################################################################
LABEL maintainer="Bruno Willenborg"
LABEL maintainer.email="b.willenborg(at)tum.de"
LABEL maintainer.organization="Chair of Geoinformatics, Technical University of Munich (TUM)"
LABEL source.repo="https://github.com/bwibo/k8s-init-container"
