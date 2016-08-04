.PHONY: build build-nocache run run-bash

DOCKER_NAME := baden/phoenix_chat_example
DOCKER_TAG := latest

# # dev
# DOCKER_PORT := 4000

#prod
DOCKER_PORT := 8080

build: Dockerfile
	@docker build -t $(DOCKER_NAME):$(DOCKER_TAG) .

build-nocache: Dockerfile
	@docker build --no-cache -t $(DOCKER_NAME):$(DOCKER_TAG) .

run: Dockerfile
	@echo "Open browser at http://localhost:$(DOCKER_PORT)/"
	@docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_NAME):$(DOCKER_TAG)

run-bash: Dockerfile
	@echo "Open browser at http://localhost:$(DOCKER_PORT)/"
	@docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_NAME):$(DOCKER_TAG) bash
