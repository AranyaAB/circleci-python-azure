REPO=aranyaab
NAME=circleci-python-azure
TAG=python3.7-azure2.0.43
IMAGE=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(REPO)/$(NAME):latest

run:
	docker run -it --rm $(IMAGE) bash

push: build
	docker push $(IMAGE)
	docker push $(REPO)/$(NAME):latest
