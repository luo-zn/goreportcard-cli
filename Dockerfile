FROM golang:alpine

RUN apk add --update --no-cache git \
    && go get -u -v github.com/alecthomas/gometalinter github.com/gordonklaus/ineffassign github.com/golang/lint/golint

COPY ./scripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD goreportcard-cli