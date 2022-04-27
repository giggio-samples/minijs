.PHONY: default clean run docker_build_alpine_amd64 slim docker_build_alpine_amd64_distroless slim_distroless

default: slim slim_distroless

run:
	node index.js

docker_build_alpine_amd64:
	docker build -f Dockerfile -t minijs .
	docker images minijs

slim: docker_build_alpine_amd64
	docker-slim build minijs
	docker images minijs.slim

docker_build_alpine_amd64_distroless:
	docker build -f Dockerfile.distroless -t minijs:distroless .
	docker images minijs:distroless

slim_distroless: docker_build_alpine_amd64_distroless
	docker-slim build --tag minijs:distroless-slim minijs:distroless
	docker images minijs:distroless-slim
