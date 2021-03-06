REPO=aranyaab
NAME=circleci-python-azure
TAG=python3.8-azure2.21.0-v1
IMAGE=$(REPO)/$(NAME)

build:
	docker build -t $(IMAGE):$(TAG) .
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest

slim: build
	docker-slim build --http-probe $(IMAGE):$(TAG)
	docker rmi $(IMAGE):$(TAG)
	docker tag $(IMAGE).slim $(IMAGE):$(TAG)
	docker rmi $(IMAGE).slim:latest

push:
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest

run:
	docker run -it --rm $(IMAGE):$(TAG) bash
