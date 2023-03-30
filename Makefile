NAME=faktory_worker
VERSION=0.5.0

build: clean
	go build -o faktory-cron *.go

run: build
	./faktory-cron

clean:
	-rm -rf faktory-cron

fmt:
	go fmt ./...
