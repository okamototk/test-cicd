From golang:latest as builder
ADD main.go /
WORKDIR / 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo main.go

From scratch
EXPOSE 80
COPY --from=builder /main /web
ENTRYPOINT ["/web"]