.PHONY: build stop-services start-services bench gogo

all: gogo

build:
	make -C go build

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop isuda.go.service
	sudo systemctl stop isutar.go.service
	sudo systemctl stop mysql

start-services:
	sudo systemctl start mysql
	sleep 5
	sudo systemctl start isuda.go.service
	sudo systemctl start isutar.go.service
	sudo systemctl start nginx

bench:
	cd ~/isucon6q && ./isucon6q-bench

kataribe:
	sudo cat /var/log/nginx/access.log | ./kataribe

gogo: stop-services start-services build bench
