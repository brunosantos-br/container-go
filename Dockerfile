FROM golang:alpine AS go-builder

WORKDIR /go/

COPY ${PWD} . 

WORKDIR /go/src/

RUN go build -o /go/bin/main main.go

FROM scratch

WORKDIR /bin/

COPY --from=go-builder /go/bin/main /bin/main

ENTRYPOINT [ "./main"]