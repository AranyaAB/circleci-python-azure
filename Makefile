REPO=aranyaab
NAME=circleci-python-azure
TAG=python3.7-azure2.0.69
IMAGE=$(REPO)/$(NAME)

build:
	docker build --network host -t $(IMAGE):$(TAG) .

slim: build
	docker-slim build --http-probe $(IMAGE):$(TAG)
	docker rmi $(IMAGE):$(TAG)
	docker tag $(IMAGE).slim $(IMAGE):$(TAG)
	docker rmi $(IMAGE).slim:latest

tag:
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest

push: build tag
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest

run:
	docker run -it --rm $(IMAGE):$(TAG) bash
