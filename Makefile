

up:
	docker login -u NEXUS-USER -p NEXUS-PASSWORD DOCKER-REGISTRY
	docker pull DOCKER-REGISTRY/openecomp/dcae-controller:DCAE-VERSION
	/opt/docker/docker-compose up -d
down:
	docker exec `docker ps | grep dcae-controller: | cut -c1-12` /opt/app/dcae-controller-platform-server/bin/controller-shutdown.sh
	/opt/docker/docker-compose down
enter: 
	docker exec -it `docker ps | grep dcae-controller: | cut -c1-12` bash
