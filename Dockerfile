FROM golang:1.19-bullseye

WORKDIR /app

COPY . .

RUN go get -u github.com/cosmtrek/air && \
go build -o /go/bin/air github.com/cosmtrek/air

CMD ["air", "-c", ".air.toml"]