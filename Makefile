dependencies:
	python3 -m pip install ansible
	python3 -m pip install docker-compose

certs:
	ansible-playbook -i hosts nginx-certs.yml

default-config:
	mkdir -p nginx/conf.d
	cp -f default.template.conf nginx/conf.d/default.conf

install: certs default-config
	docker-compose up -d

test:
	docker exec nginx nginx -t

reload:
	docker exec nginx nginx -s reload

restart:
	docker exec nginx nginx -s restart
