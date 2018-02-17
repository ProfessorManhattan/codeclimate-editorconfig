.PHONY: image test

IMAGE_NAME ?= codeclimate/codeclimate-editorconfig

image:
	docker build --rm -t $(IMAGE_NAME) .

test: image
	docker run --rm -v $$PWD/test/fixtures:/code $(IMAGE_NAME) sh -c "node /usr/src/app/bin.js"
