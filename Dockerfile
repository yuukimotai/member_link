#デプロイ用コンテナに含めるバイナリを作成するコンテナ
FROM golang:1.19-bullseye as deploy-builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go.mod download

COPY . .
RUN go build -trimpath -ldflags "-w -s" -o app

#-----------------------------------------------

#デプロイ用コンテナ
FROM　debian:bullseye-slim as deploy

RUN apt update

COPY --from=deploy-builder /app/app .

CMD["./app"]

#-----------------------------------------------
FROM golang:1.19-bullseye

WORKDIR /app

COPY . .

RUN go get -u github.com/cosmtrek/air && \
go build -o /go/bin/air github.com/cosmtrek/air

CMD ["air", "-c", ".air.toml"]