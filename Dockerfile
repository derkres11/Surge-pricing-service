FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod ./ 
RUN go mod download

COPY . .

RUN go build -o /main ./cmd/server/main.go


FROM alpine:latest
WORKDIR /root/
COPY --from=builder /main .

CMD ["./main"]