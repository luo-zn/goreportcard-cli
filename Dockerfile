FROM golang:alpine

RUN apk add --update --no-cache git \
    && go get -u -v github.com/alecthomas/gometalinter github.com/gordonklaus/ineffassign \
    && mkdir -p $GOPATH/src/github.com/golang  && cd $GOPATH/src/github.com/golang \
    && git clone https://github.com/golang/lint.git && git clone https://github.com/golang/tools.git \
    && mkdir $GOPATH/src/golang.org/x/ -p \
    && cp -rf $GOPATH/src/github.com/golang/tools $GOPATH/src/golang.org/x/  \
    && cp -rf $GOPATH/src/github.com/golang/lint $GOPATH/src/golang.org/x/  \
    && go install golang.org/x/tools golang.org/x/lint

COPY ./scripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD goreportcard-cli