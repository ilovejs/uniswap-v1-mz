SHELL := /bin/bash

ifeq (, $(shell which pip3))
	pip := $(shell which pip3)
else
	pip := $(shell which pip)
endif

.PHONY: test

test:
	pytest -vx tests/

