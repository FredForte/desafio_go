FROM golang AS builder
WORKDIR /app
COPY /source .
RUN go env -w GO111MODULE=auto
RUN go build code.go

FROM scratch
COPY --from=builder /app/code .
CMD ["./code"]