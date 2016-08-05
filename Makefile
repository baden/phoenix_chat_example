.PHONY: build build-nocache run run-bash

DOCKER_NAME := baden/phoenix_chat_example
DOCKER_TAG := latest

DOCKER_PORT := 8080

DEST ?= prod
# DOCKER_DEST := dev

build: Dockerfile
	@docker build --build-arg DEST=$(DEST) --build-arg PORT=$(DOCKER_PORT) -t $(DOCKER_NAME):$(DOCKER_TAG) .

build-nocache: Dockerfile
	@docker build --no-cache --build-arg DEST=$(DEST) --build-arg PORT=$(DOCKER_PORT) -t $(DOCKER_NAME):$(DOCKER_TAG) .

run: Dockerfile
	@echo "Open browser at http://localhost:$(DOCKER_PORT)/"
	@docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_NAME):$(DOCKER_TAG)

run-bash: Dockerfile
	@echo "Open browser at http://localhost:$(DOCKER_PORT)/"
	@docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_NAME):$(DOCKER_TAG) bash
