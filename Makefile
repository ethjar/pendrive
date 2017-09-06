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
# TODO: Create custom iso
	 touch ethjar.iso

ethjar.zip: ethjar.iso
	docker run --rm -v $(CURDIR):/workspace -ti eu.gcr.io/ethjar-store/ethjar:usb

console:
	docker run --rm --privileged -v $(CURDIR):/workspace -ti eu.gcr.io/ethjar-store/ethjar:usb bash

clean:
	rm ethjar.iso
	rm ethjar.zip
.PHONY: clean