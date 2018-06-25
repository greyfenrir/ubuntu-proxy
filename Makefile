NAME=taurus-proxy
CWD=$(shell pwd)
TAURUS_DIR=$(abspath $(CWD)/../taurus)

.PHONY: build

build:
	docker build -t $(NAME) .

run:
	docker run --privileged -it -v $(TAURUS_DIR):/bzt $(NAME)
