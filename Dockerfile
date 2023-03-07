FROM golang:1.20.1-alpine AS builder

WORKDIR /src

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /src

COPY --from=builder /src /src

CMD ["./main"]