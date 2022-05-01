From golang:latest as builder
USER root
ADD main.go /
WORKDIR / 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo main.go

From centos:7.0.1406
EXPOSE 80
COPY --from=builder /main /web
ENTRYPOINT ["/web"]
