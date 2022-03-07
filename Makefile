.PHONY: image test

IMAGE_NAME ?= codeclimate/codeclimate-editorconfig

SLIM_IMAGE_NAME ?= codeclimate/codeclimate-editorconfig:slim

image:
	docker build --rm -t $(IMAGE_NAME) .

slim: image
	docker-slim build --tag $(SLIM_IMAGE_NAME) --http-probe=false --exec '/usr/src/app/bin.js || continue' --mount "$$PWD:/code" --workdir '/code' $(IMAGE_NAME) && prettier --write slim.report.json

test: slim
	container-structure-test test --image $(IMAGE_NAME) --config test/container-test-config.yaml && container-structure-test test --image $(SLIM_IMAGE_NAME) --config test/container-test-config.yaml

#test: image
#	docker run --rm -v $$PWD/test/fixtures:/code $(IMAGE_NAME) sh -c "node /usr/src/app/bin.js"
