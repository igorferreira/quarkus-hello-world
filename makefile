multistage:
	docker build -f src/main/docker/Dockerfile.multistage -t quarkus-quickstart/getting-started .

build-docker:
	docker build -f Dockerfile -t igorferreira/quarkus-hello-world .

build-docker-minimal:
	docker build -f Dockerfile.minimal -t igorferreira/quarkus-hello-world-minimal .

run-docker:
	docker run -i --rm -p 8080:8080 igorferreira/quarkus-hello-world

run-docker-minimal:
	docker run -i --rm -p 8080:8080 igorferreira/quarkus-hello-world-minimal

mvn-build-docker:
	mvn package -Pnative -Dnative-image.docker-build=true

test:
	curl -l -XGET localhost:8080/hello

check-image-size:
	docker images | grep igorferreira/quarkus-hello-world*

remove-images:
	docker rmi $(docker images igorferreira/quarkus-hello-world* -q --no-trunc)
