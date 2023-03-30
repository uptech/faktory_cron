FROM golang:1.19-alpine AS builder
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN go build

FROM alpine
RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*
COPY --from=builder /app/faktory-cron /faktory-cron
CMD /faktory-cron -config /crontab.yaml