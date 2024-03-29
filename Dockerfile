FROM node:16-alpine AS codeclimate

WORKDIR /usr/local/bin

COPY local/codeclimate-editorconfig ./codeclimate-editorconfig
COPY local/app-package.json ./package.json

RUN adduser --uid 9000 --gecos "" --disabled-password app \
    && apk add --no-cache --virtual run-deps grep \
    && npm install --production

USER app

VOLUME /code
WORKDIR /code

CMD ["codeclimate-editorconfig"]

ARG BUILD_DATE
ARG REVISION
ARG VERSION

LABEL maintainer="Megabyte Labs <help@megabyte.space>"
LABEL org.opencontainers.image.authors="Brian Zalewski <brian@megabyte.space>"
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.description="An EditorConfig CodeClimate engine container for GitLab CI"
LABEL org.opencontainers.image.documentation="https://github.com/megabyte-labs/codeclimate-editorconfig/blob/master/README.md"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.source="https://github.com/megabyte-labs/codeclimate-editorconfig.git"
LABEL org.opencontainers.image.url="https://megabyte.space"
LABEL org.opencontainers.image.vendor="Megabyte Labs"
LABEL org.opencontainers.image.version=$VERSION
LABEL space.megabyte.type="codeclimate"

FROM codeclimate AS editorconfig

WORKDIR /work

USER root

ENTRYPOINT ["codeclimate-editorconfig"]

LABEL space.megabyte.type="linter"
