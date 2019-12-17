FROM golang:alpine as builder

LABEL mainteiner="thepliable2@gmail.com"

RUN apk add --no-cache curl git && \
    rm -rf /var/cache/apk/*

WORKDIR /burrow

RUN git clone https://github.com/linkedin/Burrow.git . && \
    go mod tidy && \
    GOBIN=`pwd` go install


FROM alpine:3.8 as app

WORKDIR /app

COPY --from=builder /burrow/Burrow /usr/bin/burrow
COPY burrow.toml .

ENTRYPOINT [ "burrow" ]