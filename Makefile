PROJECT_ID?=ethjar-store

all: docker
.PHONY: all

bootstrap:
	docker build -t usb_bootstrap .
.PHONY: bootstrap

docker:
	docker build -t eu.gcr.io/$(PROJECT_ID)/ethjar:usb .
.PHONY: docker

ethjar.iso:
	 docker run --privileged -ti --rm -v $(CURDIR):/workspace eu.gcr.io/ethjar-store/ethjar:live

ethjar.img: ethjar.iso
	docker run --rm --privileged -v $(CURDIR):/workspace -ti eu.gcr.io/ethjar-store/ethjar:usb
