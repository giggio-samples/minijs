.PHONY: default clean run docker_build_alpine_amd64 slim

default: slim

run:
	node index.js

docker_build_alpine_amd64:
	docker build -f Dockerfile -t minijs .
	docker images minijs

slim: docker_build_alpine_amd64
	docker-slim build minijs
	docker images minijs.slim
